
import 'package:flutter/material.dart';
import 'package:google_play_books/viewitems/shelves_listitem_view.dart';

import '../data/vos/shelf_vo.dart';

class ShelvesEbookListView extends StatelessWidget {
  final List<ShelfVO>? shelfList;
  final Function(String?) onTapEbook;
  final bool isShelves;
  final bool fromLibrary;
  final Function(String?) onTapViewAll;
  final bool selectShelf;
  ShelvesEbookListView(
      {required this.shelfList,
        required this.onTapEbook,
        required this.onTapViewAll,
        this.isShelves = false,
        this.fromLibrary = false,
      this.selectShelf = false});
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(
        left: 8,
      ),
      itemCount: shelfList?.length ?? 0,
      itemBuilder: (context, index) {
        return ShelvesListitemView(
          selectShelf: selectShelf,
          total: shelfList?[index].books?.length ?? 0,
          shelf: shelfList?[index],
          onTapEbook: (name) {
            onTapEbook(name);
          },
          onTapViewAll: (title) {
            onTapViewAll(title);
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