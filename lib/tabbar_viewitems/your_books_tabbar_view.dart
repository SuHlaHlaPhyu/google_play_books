import 'package:flutter/material.dart';
import 'package:google_play_books/pages/ebooks_detail_page.dart';
import 'package:google_play_books/viewitems/custom_ebooks_listview.dart';
import 'package:google_play_books/viewitems/horizontal_chips_listview.dart';

import '../dummy/dummy_data.dart';
import '../viewitems/sortby_layout_section_view.dart';

class YourBookTabbarView extends StatefulWidget {
  const YourBookTabbarView({Key? key}) : super(key: key);

  @override
  State<YourBookTabbarView> createState() => _YourBookTabbarViewState();
}

class _YourBookTabbarViewState extends State<YourBookTabbarView> {
  bool is3x3GridView = false;
  bool is2x2GridView = false;
  bool islistView = true;
  var val;
  @override
  Widget build(BuildContext context) {
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
                setState(
                  () {
                    if (islistView) {
                      islistView = false;
                      is2x2GridView = true;
                      is3x3GridView = false;
                    } else if (is3x3GridView) {
                      is3x3GridView = false;
                      islistView = true;
                      is2x2GridView = false;
                    } else {
                      is2x2GridView = false;
                      is3x3GridView = true;
                      islistView = false;
                    }
                  },
                );
              },
              is2x2GridView: is2x2GridView,
              is3x3GridView: is3x3GridView,
              islistView: islistView,
            ),
            const SizedBox(
              height: 20.0,
            ),
            CustomEbookListView(
              fromLibrary: true,
              is3x3Grid: is3x3GridView,
              is2x2Grid: is2x2GridView,
              ebooksList: ebookList,
              onTapEbook: (index) {
                /// ebook details
                _navigateToEbooksDetailpage(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToEbooksDetailpage(
    BuildContext context,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EbooksDetailPage(),
      ),
    );
  }
}
