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
                  SortByAndLayoutSectionView(
                    onTapLayoutView: () {

                      bloc.checkLayout();
                    },
                    is2x2GridView: false,
                    is3x3GridView: false,
                    islistView: true,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomEbookListView(
                    fromLibrary: true,
                    is3x3Grid: true,
                    is2x2Grid: false,
                    ebooksList: bookList,
                    onTapEbook: (index) {
                      /// ebook details
                      _navigateToEbooksDetailpage(context);
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
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EbooksDetailPage(
          title: "",
        ),
      ),
    );
  }
}
