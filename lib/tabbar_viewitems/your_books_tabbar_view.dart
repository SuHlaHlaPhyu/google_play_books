import 'package:flutter/material.dart';
import 'package:google_play_books/pages/ebooks_detail_page.dart';
import 'package:google_play_books/viewitems/custom_ebooks_listview.dart';
import 'package:google_play_books/viewitems/horizontal_chips_listview.dart';
import 'package:google_play_books/viewitems/layout_view.dart';
import 'package:google_play_books/viewitems/sortby_view.dart';

import '../dummy/dummy_data.dart';

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
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SortByView(
                  filterName: "Recent",
                  onTap: () {
                    showModalBottomSheetView(context);
                  },
                ),
                const Spacer(),
                LayoutView(
                  onTap: () {
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
                  is3x3GridView: is3x3GridView,
                  is2x2GridView: is2x2GridView,
                  isListView: islistView,
                ),
              ],
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

  showModalBottomSheetView(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "Sort by",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              const Divider(),
              ListTile(
                title: const Text(
                  "Recently opened",
                  style: TextStyle(fontSize: 16.0),
                ),
                leading: Radio(
                  value: 1,
                  groupValue: val,
                  onChanged: (value) {
                    Navigator.pop(context);
                    setState(() {
                      val = value;
                    });
                  },
                  activeColor: Colors.blue,
                ),
              ),
              ListTile(
                title: const Text(
                  "Title",
                  style: TextStyle(fontSize: 16.0),
                ),
                leading: Radio(
                  value: 2,
                  groupValue: val,
                  onChanged: (value) {
                    Navigator.pop(context);
                    setState(() {
                      val = value;
                    });
                  },
                  activeColor: Colors.blue,
                ),
              ),
              ListTile(
                title: const Text(
                  "Author",
                  style: TextStyle(fontSize: 16.0),
                ),
                leading: Radio(
                  value: 3,
                  groupValue: val,
                  onChanged: (value) {
                    Navigator.pop(context);
                    setState(() {
                      val = value;
                    });
                  },
                  activeColor: Colors.blue,
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
