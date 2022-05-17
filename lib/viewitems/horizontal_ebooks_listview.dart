import 'package:flutter/material.dart';
import 'package:google_play_books/data/vos/books_vo.dart';
import 'package:google_play_books/dummy/ebooks.dart';

import 'ebook_view.dart';

class HorizontalEbookListView extends StatelessWidget {
  final List<BooksVO>? ebooksList;
  final Function(int?) onTapEbook;
  final Function(int?) onTapMenu;
  HorizontalEbookListView({
    required this.ebooksList,
    required this.onTapEbook,
    required this.onTapMenu,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //onTapEbook(ebooksList?[index].title);
      },
      child: Container(
        padding: const EdgeInsets.only(left: 8.0),
        height: 280,
        child: ListView.builder(
          padding: const EdgeInsets.only(
            left: 8,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: ebooksList?.length,
          itemBuilder: (context, index) {
            return EbookView(
              onTapMenu: (){
                onTapMenu(index);
              },
              ebook: ebooksList?[index],
              onTapEbook: () {
                onTapEbook(index);
              },
            );
          },
        ),
      ),
    );
  }
}
