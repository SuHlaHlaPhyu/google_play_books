
import 'package:flutter/material.dart';
import 'package:google_play_books/viewitems/shelves_listitem_view.dart';

import '../data/vos/shelf_vo.dart';

class ShelvesEbookListView extends StatelessWidget {
  final List<ShelfVO>? shelfList;
  final Function(int?) onTapEbook;
  final bool isShelves;
  final bool fromLibrary;
  final Function onTapViewAll;
  ShelvesEbookListView(
      {required this.shelfList,
        required this.onTapEbook,
        required this.onTapViewAll,
        this.isShelves = false,
        this.fromLibrary = false});
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(
        left: 8,
      ),
      itemCount: shelfList?.length ?? 0,
      itemBuilder: (context, index) {
        return ShelvesListitemView(
          total: shelfList?[index].books?.length ?? 0,
          shelf: shelfList?[index],
          onTapEbook: () {
            onTapEbook(1);
          },
          onTapViewAll: () {
            onTapViewAll();
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