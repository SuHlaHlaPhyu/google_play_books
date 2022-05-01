import 'package:flutter/material.dart';
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
              children: const [
                YourBookTabbarView(),
                YourShelvesTabbarView(),
              ],
            ),
          ),
        ],
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
        : SizedBox(
            width: 150.0,
            child: FloatingActionButton(
              isExtended: true,
              onPressed: null,
              backgroundColor: Colors.blue,
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
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("create new")
                  ],
                ),
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
