import 'package:flutter/material.dart';
import 'package:google_play_books/blocs/search_bloc.dart';
import 'package:google_play_books/data/vos/books_vo.dart';
import 'package:google_play_books/pages/search_result_page.dart';
import 'package:google_play_books/viewitems/ebook_listitem_view.dart';
import 'package:google_play_books/viewitems/ebook_view.dart';
import 'package:provider/provider.dart';

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
        selector: (BuildContext context, bloc) => bloc.searchResult,
        builder: (BuildContext context, searchList, Widget? child) {
          SearchBloc bloc = Provider.of(context, listen: false);
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
                ),
              ),
              title: TextField(
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
                      searchList: searchList ?? [],
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
                        onTapEbook: () {
                          _navigateToEbooksDetailpage(context,searchList?[index].title ?? "");
                        },
                      );
                    },
                  ),
          );
        },
      ),
    );
  }
  void _navigateToEbooksDetailpage(BuildContext context, String bookName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EbooksDetailPage(
          title: bookName,
        ),
      ),
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
