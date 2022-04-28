import 'package:flutter/material.dart';
import 'package:google_play_books/viewitems/custom_ebooks_listview.dart';
import 'package:google_play_books/viewitems/layout_view.dart';
import 'package:google_play_books/viewitems/menu_item_view.dart';
import 'package:google_play_books/viewitems/shelve_title_section_view.dart';
import 'package:google_play_books/viewitems/sortby_view.dart';

import '../dummy/dummy_data.dart';

class ShelvesPage extends StatefulWidget {
  const ShelvesPage({Key? key}) : super(key: key);

  @override
  State<ShelvesPage> createState() => _ShelvesPageState();
}

class _ShelvesPageState extends State<ShelvesPage> {
  bool isGridView = false;
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
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SortByView(
                  filterName: "Recent",
                  onTap: () {
                    // showModalBottomSheetView(context);
                  },
                ),
                const Spacer(),
                LayoutView(
                  onTap: () {
                    setState(
                      () {
                        if (isGridView) {
                          isGridView = false;
                        } else {
                          isGridView = true;
                        }
                      },
                    );
                  },
                  isGridView: isGridView,
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            CustomEbookListView(
              fromLibrary: true,
              isGrid: isGridView,
              ebooksList: ebookList,
              onTapEbook: (index) {
                ///
              },
            ),
          ],
        ),
      ),
    );
  }
}
