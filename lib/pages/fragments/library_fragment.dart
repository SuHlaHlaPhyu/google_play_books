import 'package:flutter/material.dart';
import 'package:google_play_books/dummy/dummy_data.dart';
import 'package:google_play_books/pages/shelves_page.dart';
import 'package:google_play_books/pages/viewitems/custom_ebooks_listview.dart';

import '../../dummy/ebooks.dart';
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

  void _navigateToShelvesPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ShelvesPage(),
      ),
    );
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
                      Expanded(
                        child: CustomEbookListView(
                          fromLibrary: true,
                          isGrid: isGridView,
                          ebooksList: ebookList,
                          onTapEbook: (index) {
                            ///
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                ShelvesEbookListView(
                  isShelves: true,
                  ebooksList: ebookList,
                  onTapEbook: (index) {
                    _navigateToShelvesPage(context);
                  },
                  onTapViewAll: () {
                    _navigateToShelvesPage(context);
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

class SortByView extends StatelessWidget {
  final Function onTap;
  final String filterName;
  SortByView({required this.onTap, required this.filterName});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            onTap();
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
        Text("Sort by : $filterName"),
      ],
    );
  }
}

class LayoutView extends StatelessWidget {
  final bool isGridView;
  final Function onTap;
  LayoutView({
    required this.isGridView,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
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
    );
  }
}

class ShelvesEbookListView extends StatelessWidget {
  final List<Ebooks>? ebooksList;
  final Function(int?) onTapEbook;
  final bool isShelves;
  final bool fromLibrary;
  final Function onTapViewAll;
  ShelvesEbookListView(
      {required this.ebooksList,
      required this.onTapEbook,
      required this.onTapViewAll,
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
          onTapViewAll: () {
            onTapViewAll();
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          thickness: 1.0,
        );
      },
    );
  }
}
