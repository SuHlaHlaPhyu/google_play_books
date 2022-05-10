import 'package:flutter/material.dart';
import 'package:google_play_books/blocs/home_bloc.dart';
import 'package:google_play_books/data/vos/list_vo.dart';
import 'package:google_play_books/dummy/dummy_data.dart';
import 'package:provider/provider.dart';

import '../pages/ebooks_detail_page.dart';
import '../pages/view_all_ebooks_page.dart';
import '../viewitems/ebooks_list_section_view.dart';

class EbookTabbarView extends StatefulWidget {
  const EbookTabbarView({Key? key}) : super(key: key);

  @override
  State<EbookTabbarView> createState() => _EbookTabbarViewState();
}

class _EbookTabbarViewState extends State<EbookTabbarView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeBloc(),
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
}
