import 'package:flutter/material.dart';
import 'package:getwidget/components/search_bar/gf_search_bar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List list = [
    "Flutter",
    "Angular",
    "Node js",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GFSearchBar(
            overlaySearchListHeight: MediaQuery.of(context).size.height,
            searchList: list,
            searchQueryBuilder: (query, list) => list.where((item) {
                  return item!
                      .toString()
                      .toLowerCase()
                      .contains(query.toLowerCase());
                }).toList(),
            overlaySearchListItemBuilder: (dynamic item) => Container(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    item,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
            onItemSelected: (dynamic item) {
              setState(() {
                print('$item');
              });
            }),
      ),
    );
  }
}
