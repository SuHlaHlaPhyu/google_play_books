import 'package:flutter/material.dart';
import 'package:google_play_books/pages/ebooks_detail_page.dart';
import 'package:google_play_books/viewitems/custom_ebooks_listview.dart';
import 'package:google_play_books/viewitems/horizontal_chips_listview.dart';
import 'package:provider/provider.dart';

import '../blocs/your_book_bloc.dart';
import '../data/vos/books_vo.dart';
import '../viewitems/sortby_layout_section_view.dart';

class YourBookTabbarView extends StatefulWidget {
  const YourBookTabbarView({Key? key}) : super(key: key);

  @override
  State<YourBookTabbarView> createState() => _YourBookTabbarViewState();
}

class _YourBookTabbarViewState extends State<YourBookTabbarView> {
  var val;
  String name = "Recent";
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => YourBookBloc(),
      child: Selector<YourBookBloc, List<BooksVO>?>(
        shouldRebuild: (previous, next) => previous != next,
        selector: (BuildContext context, bloc) => bloc.viewBookList,
        builder: (BuildContext context, bookList, Widget? child) {
          YourBookBloc bloc = Provider.of(context, listen: false);
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 15.0,
                  ),
                  Selector<YourBookBloc, List<String?>?>(
                    selector: (BuildContext context, bloc) => bloc.categoryList,
                    builder:
                        (BuildContext context, categoryList, Widget? child) {
                      return HorizontalChipsListview(
                        onTapClear: (){
                          bloc.setToDefault();
                        },
                        chipsList: categoryList ?? [],
                        onTapEbook: (String? name) {
                         bloc.getBookByCategory(name ?? "");
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Selector<YourBookBloc, bool>(
                    selector: (BuildContext context, bloc) => bloc.islistView,
                    builder: (BuildContext context, listView, Widget? child) {
                      return Selector<YourBookBloc, bool>(
                        selector: (BuildContext context, bloc) =>
                            bloc.is2x2GridView,
                        builder:
                            (BuildContext context, twoGirdView, Widget? child) {
                          return Selector<YourBookBloc, bool>(
                            selector: (BuildContext context, bloc) =>
                                bloc.is3x3GridView,
                            builder: (BuildContext context, threeGirdView,
                                Widget? child) {
                              return SortByAndLayoutSectionView(
                                sortName: name,
                                onTapSortBy: () {
                                  YourBookBloc bloc =
                                      Provider.of(context, listen: false);
                                  showModalBottomSheetView(context, bloc);
                                },
                                onTapLayoutView: () {
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
                  Selector<YourBookBloc, bool?>(
                    selector: (BuildContext context, bloc) => bloc.islistLayout,
                    builder: (BuildContext context, listView, Widget? child) {
                      return Selector<YourBookBloc, bool?>(
                        selector: (BuildContext context, bloc) =>
                            bloc.is2x2GridLayout,
                        builder:
                            (BuildContext context, twoGirdView, Widget? child) {
                          return Selector<YourBookBloc, bool?>(
                            selector: (BuildContext context, bloc) =>
                                bloc.is3x3GridLayout,
                            builder: (BuildContext context, threeGirdView,
                                Widget? child) {
                              return CustomEbookListView(
                                fromLibrary: true,
                                is3x3Grid: threeGirdView ?? true,
                                is2x2Grid: twoGirdView ?? false,
                                ebooksList: bookList,
                                onTapEbook: (index) {
                                  /// ebook details
                                  _navigateToEbooksDetailpage(context,
                                      bookList?[index ?? 0].title ?? "",bookList?[index ?? 0].category ?? "");
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

  void _navigateToEbooksDetailpage(BuildContext context, String name, String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EbooksDetailPage(
          title: name,
          category: category,
        ),
      ),
    );
  }

  showModalBottomSheetView(BuildContext context, YourBookBloc bloc) {
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
