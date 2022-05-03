import 'package:flutter/material.dart';
import 'package:flutter_textfield_autocomplete/flutter_textfield_autocomplete.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  GlobalKey<TextFieldAutoCompleteState<String>> key = GlobalKey();

  TextFieldAutoComplete? searchTextField;

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: searchTextField = TextFieldAutoComplete<String>(
          controller: controller,
          style: const TextStyle(color: Colors.black, fontSize: 16.0),
          decoration: InputDecoration(
            prefixIcon: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.keyboard_backspace,
              ),
            ),
            suffixIcon: const Icon(Icons.keyboard_voice),
            contentPadding: const EdgeInsets.fromLTRB(10.0, 22.0, 10.0, 20.0),
            filled: true,
            hintText: 'Search Play Books',
            hintStyle: const TextStyle(
              fontSize: 14.0,
            ),
          ),
          itemSubmitted: (item) {
            setState(() => searchTextField?.textField?.controller?.text = item);
          },
          clearOnSubmit: false,
          key: key,
          suggestions: ["a", "b", "c"],
          itemBuilder: (context, item) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  item,
                  style: TextStyle(fontSize: 16.0),
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                ),
                Text(
                  item,
                )
              ],
            );
          },
          itemSorter: (a, b) {
            return a.compareTo(b);
          },
          itemFilter: (item, query) {
            return item.toLowerCase().startsWith(query.toLowerCase());
          },
        ),
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
  }
}
