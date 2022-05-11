import 'package:flutter/material.dart';
import 'package:google_play_books/blocs/shelf_detail_bloc.dart';
import 'package:google_play_books/data/vos/shelf_vo.dart';
import 'package:google_play_books/pages/ebooks_detail_page.dart';
import 'package:google_play_books/viewitems/custom_ebooks_listview.dart';
import 'package:google_play_books/viewitems/shelf_menu_item_view.dart';
import 'package:google_play_books/viewitems/shelve_title_section_view.dart';
import 'package:provider/provider.dart';
import '../viewitems/sortby_layout_section_view.dart';

class ShelvesPage extends StatefulWidget {
  final String shelfName;
  ShelvesPage({required this.shelfName});

  @override
  State<ShelvesPage> createState() => _ShelvesPageState();
}

class _ShelvesPageState extends State<ShelvesPage> {
  var val;
  String name = "Recent";
  void _navigateToEbooksDetailpage(
    BuildContext context,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EbooksDetailPage(
          title: "test",
          category: "",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ShelfDetailBloc(widget.shelfName),
      child: Selector<ShelfDetailBloc, ShelfVO?>(
        selector: (BuildContext context, bloc) => bloc.shelf,
        builder: (BuildContext context, shelfDetail, Widget? chile) {
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
                      title: shelfDetail?.shelfName ?? "",
                      subTitle: "${shelfDetail?.books?.length} Books",
                    ),
                  ),
                  const Divider(
                    thickness: 1.0,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Selector<ShelfDetailBloc, bool>(
                    selector: (BuildContext context, bloc) => bloc.islistView,
                    builder: (BuildContext context, listView, Widget? child) {
                      return Selector<ShelfDetailBloc, bool>(
                        selector: (BuildContext context, bloc) =>
                        bloc.is2x2GridView,
                        builder:
                            (BuildContext context, twoGirdView, Widget? child) {
                          return Selector<ShelfDetailBloc, bool>(
                            selector: (BuildContext context, bloc) =>
                            bloc.is3x3GridView,
                            builder: (BuildContext context, threeGirdView,
                                Widget? child) {
                              return SortByAndLayoutSectionView(
                                sortName: name,
                                onTapSortBy: () {
                                  ShelfDetailBloc bloc =
                                  Provider.of(context, listen: false);
                                  showModalBottomSheetView(context, bloc);
                                },
                                onTapLayoutView: () {
                                  ShelfDetailBloc bloc =
                                  Provider.of(context, listen: false);
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
                  Selector<ShelfDetailBloc, bool?>(
                    selector: (BuildContext context, bloc) => bloc.islistLayout,
                    builder: (BuildContext context, listView, Widget? child) {
                      return Selector<ShelfDetailBloc, bool?>(
                        selector: (BuildContext context, bloc) =>
                        bloc.is2x2GridLayout,
                        builder:
                            (BuildContext context, twoGirdView, Widget? child) {
                          return Selector<ShelfDetailBloc, bool?>(
                            selector: (BuildContext context, bloc) =>
                            bloc.is3x3GridLayout,
                            builder: (BuildContext context, threeGirdView,
                                Widget? child) {
                              return CustomEbookListView(
                                fromLibrary: true,
                                is3x3Grid: threeGirdView ?? true,
                                is2x2Grid: twoGirdView ?? false,
                                ebooksList: shelfDetail?.books,
                                onTapEbook: (index) {
                                  /// ebook details

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

  showModalBottomSheetView(BuildContext context, ShelfDetailBloc bloc) {
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
              Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: val,
                    onChanged: (value) {
                      Navigator.pop(context);
                      setState(() {
                        val = value;
                        bloc.sortBy(1);
                        name = "Recent";
                      });
                    },
                    activeColor: Colors.blue,
                  ),
                  const Text(
                    "Recently",
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 2,
                    groupValue: val,
                    onChanged: (value) {
                      Navigator.pop(context);
                      setState(() {
                        val = value;
                        bloc.sortBy(2);
                        name = "Title";
                      });
                    },
                    activeColor: Colors.blue,
                  ),
                  const Text(
                    "Title",
                    style: TextStyle(fontSize: 16.0),
                  )
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 3,
                    groupValue: val,
                    onChanged: (value) {
                      Navigator.pop(context);
                      setState(() {
                        val = value;
                        bloc.sortBy(3);
                        name = "Author";
                      });
                    },
                    activeColor: Colors.blue,
                  ),
                  const Text(
                    "Author",
                    style: TextStyle(fontSize: 16.0),
                  )
                ],
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
