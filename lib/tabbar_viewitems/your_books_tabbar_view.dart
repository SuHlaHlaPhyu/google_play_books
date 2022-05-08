import 'package:flutter/material.dart';
import 'package:google_play_books/pages/ebooks_detail_page.dart';
import 'package:google_play_books/viewitems/custom_ebooks_listview.dart';
import 'package:google_play_books/viewitems/horizontal_chips_listview.dart';
import 'package:provider/provider.dart';

import '../blocs/your_book_bloc.dart';
import '../data/vos/books_vo.dart';
import '../viewitems/sortby_layout_section_view.dart';

class YourBookTabbarView extends StatefulWidget {
  const YourBookTabbarView({Key? key}) : super(key: key);

  @override
  State<YourBookTabbarView> createState() => _YourBookTabbarViewState();
}

class _YourBookTabbarViewState extends State<YourBookTabbarView> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => YourBookBloc(),
      child: Selector<YourBookBloc, List<BooksVO>?>(
        shouldRebuild: (previous, next) => previous != next,
        selector: (BuildContext context, bloc) => bloc.viewBookList,
        builder: (BuildContext context, bookList, Widget? child) {
          YourBookBloc bloc = Provider.of(context, listen: false);
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 15.0,
                  ),
                  HorizontalChipsListview(
                    chipsList: const [],
                    onTapEbook: (int? index) {
                      //
                    },
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Selector<YourBookBloc, bool>(
                    selector: (BuildContext context, bloc)=> bloc.islistView,
                    builder: (BuildContext context, listView, Widget? child){
                      return  Selector<YourBookBloc, bool>(
                        selector: (BuildContext context, bloc)=> bloc.is2x2GridView,
                        builder: (BuildContext context, twoGirdView, Widget? child){
                          return  Selector<YourBookBloc, bool>(
                            selector: (BuildContext context, bloc)=> bloc.is3x3GridView,
                            builder: (BuildContext context, threeGirdView, Widget? child){
                              return SortByAndLayoutSectionView(
                              onTapSortBy: (index){
                              ///
                                YourBookBloc bloc = Provider.of(context, listen: false);
                                bloc.sortBy(index);
                                print("===============> $index");
                              },
                              onTapLayoutView: () {
                              bloc.checkLayout();
                              },
                              is2x2GridView: twoGirdView,
                              is3x3GridView: threeGirdView,
                              islistView: listView,
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Selector<YourBookBloc, bool?>(
                    selector: (BuildContext context, bloc)=> bloc.islistLayout,
                    builder: (BuildContext context, listView, Widget? child){
                      return  Selector<YourBookBloc, bool?>(
                        selector: (BuildContext context, bloc)=> bloc.is2x2GridLayout,
                        builder: (BuildContext context, twoGirdView, Widget? child){
                          return  Selector<YourBookBloc, bool?>(
                            selector: (BuildContext context, bloc)=> bloc.is3x3GridLayout,
                            builder: (BuildContext context, threeGirdView, Widget? child){
                              return  CustomEbookListView(
                                fromLibrary: true,
                                is3x3Grid: threeGirdView ?? true,
                                is2x2Grid: twoGirdView ?? false,
                                ebooksList: bookList,
                                onTapEbook: (index) {
                                  /// ebook details
                                  _navigateToEbooksDetailpage(context, bookList?[index ?? 0].title ?? "");
                                },
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _navigateToEbooksDetailpage(
    BuildContext context,
      String name
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EbooksDetailPage(
          title: name ,
        ),
      ),
    );
  }
}
