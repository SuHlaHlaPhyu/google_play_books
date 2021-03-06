import 'package:flutter/material.dart';
import 'package:google_play_books/blocs/shelf_detail_bloc.dart';
import 'package:google_play_books/data/vos/shelf_vo.dart';
import 'package:google_play_books/viewitems/custom_ebooks_listview.dart';
import 'package:google_play_books/viewitems/shelf_menu_item_view.dart';
import 'package:google_play_books/viewitems/shelve_title_section_view.dart';
import 'package:provider/provider.dart';
import '../data/vos/books_vo.dart';
import '../viewitems/sortby_layout_section_view.dart';
import 'add_to_shelf_page.dart';

class ShelvesPage extends StatefulWidget {
  final String shelfName;
  ShelvesPage({required this.shelfName});

  @override
  State<ShelvesPage> createState() => _ShelvesPageState();
}

class _ShelvesPageState extends State<ShelvesPage> {
  var val;
  String name = "Recent";
  TextEditingController userInput = TextEditingController();
  FocusNode inputFocus = FocusNode();

  ShelfDetailBloc? shelfDetailBloc;

  @override
  void initState() {
    shelfDetailBloc = ShelfDetailBloc(widget.shelfName);
    super.initState();
  }

  @override
  void dispose() {
    shelfDetailBloc?.clearDisposeNotify();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => shelfDetailBloc,
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
                Selector<ShelfDetailBloc, bool>(
                  selector: (BuildContext context, bloc) => bloc.isEdit,
                  builder: (BuildContext context, isEdit, Widget? child) {
                    return MenuItemView(
                      iconColor: Colors.black,
                      onTapRename: () {
                        ShelfDetailBloc bloc =
                            Provider.of(context, listen: false);
                        bloc.editShelf();
                        setState(
                          () {
                            userInput = TextEditingController(
                                text: shelfDetail?.shelfName);
                          },
                        );
                      },
                      onTapDelete: () {
                        Navigator.pop(context);
                        ShelfDetailBloc bloc =
                            Provider.of(context, listen: false);
                        Future.delayed(
                          const Duration(seconds: 0),
                          () => showDeleteConfirm(bloc, shelfDetail?.id),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Selector<ShelfDetailBloc, bool>(
                    selector: (BuildContext context, bloc) => bloc.isEdit,
                    builder: (BuildContext context, isEdit, Widget? child) {
                      return Column(
                        children: [
                          Visibility(
                            visible: isEdit,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                20.0,
                                30.0,
                                30.0,
                                30,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      ShelfDetailBloc bloc =
                                          Provider.of(context, listen: false);
                                      bloc.renameShelf(shelfDetail?.id ?? 0,
                                          userInput.text.toString());
                                      Navigator.pop(context);
                                    },
                                    child: const Icon(
                                      Icons.check,
                                      color: Colors.blue,
                                      key: ValueKey("renameDone"),
                                    ),
                                  ),
                                  TextField(
                                    key: const ValueKey("renameInput"),
                                    controller: userInput,
                                    focusNode: inputFocus,
                                    autofocus: true,
                                    decoration: const InputDecoration(
                                        hintText: "Shelf name"),
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.done,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Visibility(
                            visible: !isEdit,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                20.0,
                                30.0,
                                30.0,
                                30,
                              ),
                              child: ShelveTitleSectionView(
                                title: shelfDetail?.shelfName ?? "",
                                subTitle: "${shelfDetail?.books?.length} Books",
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  const Divider(
                    thickness: 1.0,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Selector<ShelfDetailBloc, List<String?>?>(
                    selector: (BuildContext context, bloc) => bloc.categoryList,
                    builder:
                        (BuildContext context, categoryList, Widget? child) {
                      return SizedBox(
                        height: 40,
                        child: ListView.builder(
                            padding: const EdgeInsets.only(
                              left: 8,
                            ),
                            scrollDirection: Axis.horizontal,
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return Row(
                                children: categoryList
                                        ?.map(
                                          (category) => GestureDetector(
                                            onTap: () {},
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(
                                                horizontal: 5.0,
                                              ),
                                              child: Chip(
                                                  shape: const StadiumBorder(
                                                    side: BorderSide(
                                                      color: Colors.black12,
                                                    ),
                                                  ),
                                                  backgroundColor: Colors.white10,
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                    horizontal: 12.0,
                                                    vertical: 10.0,
                                                  ),
                                                  label: GestureDetector(
                                                    onTap: () {},
                                                    child: Text(
                                                      category ?? "",
                                                      style: const TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  )),
                                            ),
                                          ),
                                        )
                                        .toList() ??
                                    [],
                              );
                            }),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 15.0,
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
                              return Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: CustomEbookListView(
                                  fromLibrary: true,
                                  is3x3Grid: threeGirdView ?? true,
                                  is2x2Grid: twoGirdView ?? false,
                                  ebooksList: shelfDetail?.books,
                                  onTapEbook: (index) {
                                    /// ebook details
                                  },
                                  onTapMenu: (index) {
                                    showModalBottomSheetMenuView(context,
                                        shelfDetail?.books?[index ?? 0]);
                                  },
                                ),
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

  showModalBottomSheetMenuView(BuildContext context, BooksVO? book) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Divider(),
              ListTile(
                contentPadding: const EdgeInsets.all(0.0),
                minLeadingWidth: 5.0,
                minVerticalPadding: 0.0,
                leading: const Icon(Icons.remove),
                title: const Text('Remove download'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(0.0),
                minLeadingWidth: 5.0,
                minVerticalPadding: 0.0,
                leading: const Icon(Icons.delete),
                title: const Text('Delete from library'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                key: const ValueKey("add"),
                contentPadding: const EdgeInsets.all(0.0),
                minLeadingWidth: 5.0,
                minVerticalPadding: 0.0,
                leading: const Icon(Icons.add),
                title: const Text('Add to shelf'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddToShelfPage(
                        book: book,
                      ),
                    ),
                  );
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(0.0),
                minLeadingWidth: 5.0,
                minVerticalPadding: 0.0,
                leading: const Icon(Icons.bookmark),
                title: const Text('About this ebook'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Container(
                height: 35,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: const Center(
                  child: Text(
                    "Buy \$4.9",
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
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

  void showDeleteConfirm(ShelfDetailBloc bloc, int? id) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text("Alert"),
          content: const Text("Are you sure to delete?"),
          actions: <Widget>[
            TextButton(
              child: const Text(
                "No",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              key: const ValueKey("yes"),
              child: const Text(
                "Yes",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                bloc.deleteShelf(id ?? 0);
              },
            ),
          ],
        );
      },
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
