import 'package:flutter/material.dart';
import 'package:google_play_books/pages/ebooks_detail_page.dart';
import 'package:google_play_books/viewitems/custom_ebooks_listview.dart';
import 'package:google_play_books/viewitems/shelf_menu_item_view.dart';
import 'package:google_play_books/viewitems/shelve_title_section_view.dart';

import '../dummy/dummy_data.dart';
import '../viewitems/sortby_layout_section_view.dart';

class ShelvesPage extends StatefulWidget {
  const ShelvesPage({Key? key}) : super(key: key);

  @override
  State<ShelvesPage> createState() => _ShelvesPageState();
}

class _ShelvesPageState extends State<ShelvesPage> {
  bool is3x3GridView = false;
  bool is2x2GridView = false;
  bool islistView = true;
  void _navigateToEbooksDetailpage(
    BuildContext context,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EbooksDetailPage(title: "test",),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            //
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        actions: [
          MenuItemView(
            iconColor: Colors.black,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 0.0,
                right: 0.0,
                top: 50,
                bottom: 20,
              ),
              child: ShelveTitleSectionView(
                title: "10 Integration Design book to read",
                subTitle: "3 Books",
              ),
            ),
            const Divider(
              thickness: 1.0,
            ),
            const SizedBox(
              height: 20.0,
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
              ebooksList: [],
              onTapEbook: (index) {
                ///
                _navigateToEbooksDetailpage(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
