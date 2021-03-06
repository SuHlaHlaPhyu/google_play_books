import 'package:flutter/material.dart';
import 'package:google_play_books/data/vos/shelf_vo.dart';
import 'package:google_play_books/pages/create_new_shelf_page.dart';
import 'package:google_play_books/tabbar_viewitems/your_books_tabbar_view.dart';
import 'package:google_play_books/tabbar_viewitems/your_shelves_tabbar_view.dart';

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

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController?.addListener(_handleTabIndex);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.removeListener(_handleTabIndex);
    _tabController!.dispose();
  }

  void _handleTabIndex() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, value) {
          return [
            SliverToBoxAdapter(
              child: TabBarSectionView(
                tabController: _tabController,
                tabBarOneName: "Your books",
                tabBarTwoName: "Your shelves",
              ),
            )
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: const [
            YourBookTabbarView(),
            YourShelvesTabbarView(),
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          //
          _navigateToCreateShelfpage(context);
        },
        child: _createShelf(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _navigateToCreateShelfpage(
    BuildContext context,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateNewShelf(),
      ),
    );
  }

  Widget _createShelf() {
    return _tabController?.index == 0
        ? const SizedBox()
        : Card(
            elevation: 10.0,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Container(
              key: const ValueKey("create"),
              height: kToolbarHeight,
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: SizedBox(
                width: 150.0,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    SizedBox(
                      width: 15.0,
                    ),
                    Icon(
                      Icons.edit,
                      size: 20.0,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      "create new",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
