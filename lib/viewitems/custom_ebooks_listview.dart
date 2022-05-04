import 'package:flutter/material.dart';
import 'package:google_play_books/data/vos/books_vo.dart';
import 'package:google_play_books/dummy/ebooks.dart';

import 'ebook_listitem_view.dart';
import 'ebook_view.dart';

class CustomEbookListView extends StatelessWidget {
  final List<BooksVO>? ebooksList;
  final Function(int?) onTapEbook;
  final bool is3x3Grid;
  final bool is2x2Grid;
  final bool fromLibrary;
  CustomEbookListView(
      {required this.ebooksList,
      required this.onTapEbook,
      this.is2x2Grid = false,
      this.is3x3Grid = false,
      this.fromLibrary = false});
  @override
  Widget build(BuildContext context) {
    return is3x3Grid
        ? GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
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
        : is2x2Grid
            ? GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.66,
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
                physics: const NeverScrollableScrollPhysics(),
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
