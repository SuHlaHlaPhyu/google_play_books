import 'package:flutter/material.dart';
import 'package:google_play_books/blocs/home_bloc.dart';
import 'package:google_play_books/data/vos/list_vo.dart';
import 'package:google_play_books/dummy/dummy_data.dart';
import 'package:provider/provider.dart';

import '../data/vos/books_vo.dart';
import '../pages/add_to_shelf_page.dart';
import '../pages/ebooks_detail_page.dart';
import '../pages/view_all_ebooks_page.dart';
import '../viewitems/ebooks_list_section_view.dart';

class EbookTabbarView extends StatefulWidget {
  const EbookTabbarView({Key? key}) : super(key: key);

  @override
  State<EbookTabbarView> createState() => _EbookTabbarViewState();
}

class _EbookTabbarViewState extends State<EbookTabbarView> {
  HomeBloc? homeBloc;

  @override
  void initState() {
    homeBloc = HomeBloc();
    super.initState();
  }

  @override
  void dispose() {
    homeBloc?.clearDisposeNotify();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => homeBloc,
      child: Selector<HomeBloc, List<ListVO>?>(
          selector: (BuildContext context, bloc) => bloc.overviewBooksList,
          builder: (BuildContext context, bookList, Widget? child) {
            HomeBloc bloc = Provider.of(context, listen: false);
            if (bloc.isLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              );
            }
            return ListView.builder(
              key: const ValueKey("listview"),
              itemCount: bookList?.length,
              itemBuilder: ((context, index) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 30.0,
                    ),
                    EbooksListSectionView(
                      bookList?[index].listName ?? " ",
                      ebookList: bookList?[index].books,
                      onTapEbook: (bookIndex) {
                        _navigateToEbooksDetailpage(
                            context,
                            bookList?[index].books?[bookIndex ?? 0].title ??
                                "",bookList?[index].listName ?? " ");
                      },
                      onTapViewAll: () {
                        _navigateToViewAllpage(
                            context, bookList?[index].listName ?? "");
                      },
                      onTapMenu: (index){
                        showModalBottomSheetMenuView(context, bookList?[index ?? 0].books?[index ?? 0]);
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                  ],
                );
              }),
            );
          }),
    );
  }

  void _navigateToViewAllpage(BuildContext context, String name) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ViewAllEbooksPage(
          title: name,
        ),
      ),
    );
  }

  void _navigateToEbooksDetailpage(BuildContext context, String bookName,String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EbooksDetailPage(
          title: bookName,
          category: category,
        ),
      ),
    );
  }
  showModalBottomSheetMenuView(BuildContext context,BooksVO? book) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Divider(),
              ListTile(
                contentPadding: const EdgeInsets.all(0.0),
                minLeadingWidth: 5.0,
                minVerticalPadding: 0.0,
                leading: const Icon(Icons.remove),
                title: const Text('Remove download'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(0.0),
                minLeadingWidth: 5.0,
                minVerticalPadding: 0.0,
                leading: const Icon(Icons.delete),
                title: const Text('Delete from library'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                key: const ValueKey("add"),
                contentPadding: const EdgeInsets.all(0.0),
                minLeadingWidth: 5.0,
                minVerticalPadding: 0.0,
                leading: const Icon(Icons.add),
                title: const Text('Add to shelf'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddToShelfPage(book: book,),
                    ),
                  );
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(0.0),
                minLeadingWidth: 5.0,
                minVerticalPadding: 0.0,
                leading: const Icon(Icons.bookmark),
                title: const Text('About this ebook'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Container(
                height: 35,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: const Center(
                  child: Text(
                    "Buy \$4.9",
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
            ],
          ),
        );
      },
    );
  }
}
