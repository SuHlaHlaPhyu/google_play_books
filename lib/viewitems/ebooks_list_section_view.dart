import 'package:flutter/material.dart';
import 'package:google_play_books/data/vos/books_vo.dart';
import 'package:google_play_books/dummy/ebooks.dart';
import 'package:google_play_books/viewitems/horizontal_ebooks_listview.dart';

class EbooksListSectionView extends StatelessWidget {
  final String title;
  final List<BooksVO>? ebookList;
  final Function(int?) onTapEbook;
  final Function onTapViewAll;
  final bool noMargin;
  EbooksListSectionView(
    this.title, {
    this.noMargin = false,
    required this.ebookList,
    required this.onTapEbook,
    required this.onTapViewAll,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 250,
              margin: EdgeInsets.only(
                left: noMargin ? 0 : 15,
              ),
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                onTapViewAll();
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 18.0,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        HorizontalEbookListView(
          ebooksList: ebookList,
          onTapEbook: (movieId) => onTapEbook(movieId),
        ),
      ],
    );
  }
}