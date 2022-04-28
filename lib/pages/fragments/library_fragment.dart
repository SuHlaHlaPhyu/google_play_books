import 'package:flutter/material.dart';
import 'package:google_play_books/dummy/dummy_data.dart';
import 'package:google_play_books/pages/viewitems/custom_ebooks_listview.dart';

import '../../dummy/ebooks.dart';
import '../viewitems/ebook_listitem_view.dart';
import '../viewitems/shelves_listitem_view.dart';
import '../viewitems/tabbar_section_view.dart';

class LibraryFragment extends StatefulWidget {
  const LibraryFragment({Key? key}) : super(key: key);

  @override
  State<LibraryFragment> createState() => _LibraryFragmentState();
}

class _LibraryFragmentState extends State<LibraryFragment>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  bool isGridView = false;
  var val;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TabBarSectionView(
            tabController: _tabController,
            tabBarOneName: "Your books",
            tabBarTwoName: "Your shelves",
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheetView(context);
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(
                                left: 10.0,
                              ),
                              child: Icon(Icons.sort),
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          const Text("Sort by : Recent"),
                          const Spacer(),
                          GestureDetector(
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
                            child: Padding(
                              padding: const EdgeInsets.only(
                                right: 10.0,
                              ),
                              child: isGridView
                                  ? const Icon(
                                      Icons.list,
                                    )
                                  : const Icon(
                                      Icons.grid_3x3_outlined,
                                    ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Expanded(
                        child: CustomEbookListView(
                          fromLibrary: true,
                          isGrid: isGridView,
                          ebooksList: ebookList,
                          onTapEbook: (index) {
                            ///
                          },
                        ),
                      )
                    ],
                  ),
                ),
                ShelvesEbookListView(
                  isShelves: true,
                  ebooksList: ebookList,
                  onTapEbook: (index) {
                    ///
                  },
                )
              ],
            ),
          ),
        ],
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
}

class ShelvesEbookListView extends StatelessWidget {
  final List<Ebooks>? ebooksList;
  final Function(int?) onTapEbook;
  final bool isShelves;
  final bool fromLibrary;
  ShelvesEbookListView(
      {required this.ebooksList,
      required this.onTapEbook,
      this.isShelves = false,
      this.fromLibrary = false});
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(
        left: 8,
      ),
      itemCount: 2,
      itemBuilder: (context, index) {
        return ShelvesListitemView(
          ebook: ebooksList?[index],
          onTapEbook: () {
            onTapEbook(1);
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          thickness: 1.0,
        );
      },
    );
  }
}
