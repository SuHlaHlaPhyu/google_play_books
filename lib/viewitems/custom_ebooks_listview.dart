import 'package:flutter/material.dart';
import 'package:google_play_books/dummy/ebooks.dart';

import 'ebook_listitem_view.dart';
import 'ebook_view.dart';

class CustomEbookListView extends StatelessWidget {
  final List<Ebooks>? ebooksList;
  final Function(int?) onTapEbook;
  final bool isGrid;
  final bool fromLibrary;
  CustomEbookListView(
      {required this.ebooksList,
      required this.onTapEbook,
      this.isGrid = false,
      this.fromLibrary = false});
  @override
  Widget build(BuildContext context) {
    return isGrid
        ? GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.41,
            ),
            itemCount: ebooksList?.length ?? 0,
            itemBuilder: (BuildContext ctx, index) {
              return EbookView(
                fromLibrary: fromLibrary,
                ebook: ebooksList?[index],
                onTapEbook: () {
                  // book details
                  onTapEbook(1);
                },
              );
            },
          )
        : ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.only(
              left: 8,
            ),
            itemCount: ebooksList?.length,
            itemBuilder: (context, index) {
              return EbookListitemView(
                ebook: ebooksList?[index],
                onTapEbook: () {
                  onTapEbook(1);
                },
              );
            },
          );
  }
}
