import 'package:flutter/material.dart';
import 'package:google_play_books/blocs/shelf_detail_bloc.dart';
import 'package:google_play_books/data/vos/shelf_vo.dart';
import 'package:google_play_books/pages/ebooks_detail_page.dart';
import 'package:google_play_books/viewitems/custom_ebooks_listview.dart';
import 'package:google_play_books/viewitems/shelf_menu_item_view.dart';
import 'package:google_play_books/viewitems/shelve_title_section_view.dart';
import 'package:provider/provider.dart';
import '../tabbar_viewitems/your_shelves_tabbar_view.dart';
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
  TextEditingController userInput = TextEditingController();
  FocusNode inputFocus = FocusNode();


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
                Selector<ShelfDetailBloc, bool>(
                  selector: (BuildContext context, bloc) => bloc.isEdit,
                  builder: (BuildContext context, isEdit, Widget? child) {
                    return MenuItemView(
                      iconColor: Colors.black,
                      onTapRename: () {
                        ShelfDetailBloc bloc =
                            Provider.of(context, listen: false);
                        bloc.editShelf();
                        setState(() {
                          userInput = TextEditingController(
                              text: shelfDetail?.shelfName);
                        });
                      },
                      onTapDelete: () {
                        ShelfDetailBloc bloc =
                        Provider.of(context, listen: false);
                        bloc.deleteShelf(shelfDetail?.id ?? 0);
                        Navigator.pop(context);
                       // showAlert(context, shelfDetail?.id ?? 0);
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
                                      bloc.renameShelf(shelfDetail?.id ?? 0, userInput.text.toString());
                                      Navigator.pop(context);
                                    },
                                    child: const Icon(
                                      Icons.check,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  TextField(
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

  showAlert(BuildContext context,int? id){
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: const Text('Delete Shelf'),  // To display the title it is optional
        content: const Text('Are you sure you want to delete'),   // Message which will be pop up on the screen
        // Action widget which will provide the user to acknowledge the choice
        actions: [
          TextButton(           //
            onPressed: () {},        // function used to perform after pressing the button
            child:const Text('NO'),
          ),
          TextButton(
            onPressed: () {
              // ShelfDetailBloc bloc =
              // Provider.of(context, listen: false);
              // bloc.deleteShelf(id ?? 0);
              Navigator.pop(context);
            },
            child:const Text('YES'),
          ),
        ],
      );
    });
  }
  //
  void _navigateToShelvespage(
    BuildContext context,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => YourShelvesTabbarView(

        ),
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
