import 'package:flutter/material.dart';
import 'package:google_play_books/blocs/view_all_ebooks_bloc.dart';
import 'package:google_play_books/data/vos/books_vo.dart';
import 'package:google_play_books/viewitems/ebook_view.dart';
import 'package:provider/provider.dart';

import 'add_to_shelf_page.dart';
import 'ebooks_detail_page.dart';

class ViewAllEbooksPage extends StatelessWidget {
  final String title;
  ViewAllEbooksPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ViewAllEbooksBloc(title),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          titleSpacing: 0.0,
          backgroundColor: Colors.white,
          centerTitle: false,
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 18,
            ),
          ),
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18.0,
            ),
          ),
        ),
        body: Selector<ViewAllEbooksBloc, List<BooksVO>?>(
          selector: (BuildContext context, bloc) => bloc.booksList,
          builder: (BuildContext context, bookList, Widget? child) {
            ViewAllEbooksBloc bloc = Provider.of(context, listen: false);
            if (bloc.isLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              );
            }
            return GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.70,
              ),
              itemCount: bookList?.length ?? 0,
              itemBuilder: (BuildContext ctx, index) {
                return EbookView(
                  ebook: bookList?[index],
                  onTapEbook: () {
                    // book details
                    _navigateToEbooksDetailpage(context, bookList?[index].title ?? "",bookList?[index].category ?? "");
                  },
                  onTapMenu: (){
                    showModalBottomSheetMenuView(context,bookList?[index]);
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

  void _navigateToEbooksDetailpage(
    BuildContext context, String name,String category
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EbooksDetailPage(title: name,category: category,),
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
