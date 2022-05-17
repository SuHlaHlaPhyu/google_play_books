import 'package:flutter/material.dart';
import 'package:google_play_books/blocs/search_bloc.dart';
import 'package:google_play_books/data/vos/books_vo.dart';
import 'package:google_play_books/pages/search_result_page.dart';
import 'package:google_play_books/viewitems/ebook_listitem_view.dart';
import 'package:google_play_books/viewitems/ebook_view.dart';
import 'package:provider/provider.dart';

import 'add_to_shelf_page.dart';
import 'ebooks_detail_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController controller = TextEditingController();
  final FocusNode inputFocus = FocusNode();

  void _searchBook(BuildContext context, String text) {
    final SearchBloc searchBloc = Provider.of(context, listen: false);
    searchBloc.onSearch(text);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => SearchBloc(),
      child: Selector<SearchBloc, List<BooksVO>?>(
        selector: (BuildContext context, bloc) => bloc.searchSuggestion,
        builder: (BuildContext context, searchList, Widget? child) {
          SearchBloc bloc = Provider.of(context, listen: false);
          return Selector<SearchBloc, Map<String?, List<BooksVO>>>(
            selector: (BuildContext context, bloc) => bloc.searchResult,
            builder: (BuildContext context, searchResult, Widget? child){
              return Scaffold(
                appBar: AppBar(
                  titleSpacing: 0.0,
                  automaticallyImplyLeading: false,
                  elevation: 0.0,
                  backgroundColor: Colors.white,
                  leading: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.keyboard_backspace,
                      color: Colors.blue,
                      key: ValueKey("searchBack"),
                    ),
                  ),
                  title: TextField(
                    key: const ValueKey("searchInput"),
                    controller: controller,
                    focusNode: inputFocus,
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    onChanged: (value) {
                      _searchBook(context, value);
                    },
                    onSubmitted: (value) {
                      _searchBook(context, value);
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => SearchResultPage(
                          searchList:  searchResult,
                        ),
                      ));
                    },
                  ),
                  actions: const [
                    Icon(
                      Icons.keyboard_voice,
                      color: Colors.blue,
                    ),
                  ],
                ),
                body: bloc.isSearch
                    ? Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: DefaultSuggestionView(),
                )
                    : ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  itemCount: searchList?.length,
                  itemBuilder: (context, index) {
                    return EbookListitemView(
                      isSearch: true,
                      ebook: searchList?[index],
                      onTapEbook: (){
                        // bloc.getSimilarBooks(searchList?[index].ageGroup ?? "");
                        _navigateToEbooksDetailpage(context,searchList?[index].title ?? "",searchList?[index].category ?? "");
                      },
                      onTapMenu: (){
                        showModalBottomSheetMenuView(context,searchList?[index]);
                      },
                    );
                  },
                ),
              );
            }

          );
        },
      ),
    );
  }
  void _navigateToEbooksDetailpage(BuildContext context, String bookName, String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EbooksDetailPage(
          title: bookName,
          category: category,
        ),
      ),
    );
  }
  showModalBottomSheetMenuView(BuildContext context,BooksVO? book) {
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
                      builder: (context) => AddToShelfPage(book: book,),
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
}

class DefaultSuggestionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: const [
              Icon(
                Icons.trending_up,
                color: Colors.blue,
              ),
              SizedBox(
                width: 12.0,
              ),
              Text("Top Selling"),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: const [
              Icon(
                Icons.new_releases_outlined,
                color: Colors.blue,
              ),
              SizedBox(
                width: 12.0,
              ),
              Text("New Release"),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: const [
              Icon(
                Icons.store_outlined,
                color: Colors.blue,
              ),
              SizedBox(
                width: 12.0,
              ),
              Text("Bookstore"),
            ],
          ),
        ),
      ],
    );
  }
}
