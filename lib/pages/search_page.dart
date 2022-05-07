import 'package:flutter/material.dart';
import 'package:google_play_books/blocs/search_bloc.dart';
import 'package:google_play_books/network/response/search_response.dart';
import 'package:provider/provider.dart';

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
      child: Selector<SearchBloc, SearchResponse?>(
        selector: (BuildContext context, bloc) => bloc.searchResponse,
        builder: (BuildContext context, detail, Widget? child) {
          return Scaffold(
            appBar: AppBar(
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
                },
              ),
              actions: const [
                Icon(
                  Icons.keyboard_voice,
                  color: Colors.blue,
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
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
              ),
            ),
          );
        },
      ),
    );
  }
}
