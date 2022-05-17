import 'package:flutter/material.dart';
import 'package:google_play_books/data/vos/books_vo.dart';
import 'package:google_play_books/viewitems/ebook_menu_itemview.dart';

class EbookListitemView extends StatelessWidget {
  final BooksVO? ebook;
  final Function onTapEbook;
  final bool isSearch;
  final Function onTapMenu;
  EbookListitemView(
      {required this.ebook, required this.onTapEbook, this.isSearch = false, required this.onTapMenu});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => onTapEbook(),
            child: Container(
              margin: const EdgeInsets.only(
                right: 8,
              ),
              height: 80,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  5,
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    ebook?.bookImage ?? "",
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 4.0,
          ),
          GestureDetector(
            onTap: () {
              onTapEbook();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 180,
                  child: Text(
                    ebook?.title ?? "",
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                SizedBox(
                  width: 180,
                  child: Text(
                    ebook?.author ?? "",
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          isSearch
              ? Container()
              : Row(
                  children: [
                    const Icon(
                      Icons.download_done,
                      color: Colors.black54,
                      size: 18,
                    ),
                    const SizedBox(
                      width: 35.0,
                    ),
                    EbookMenuItemView(
                      onTapMenu: (){
                        onTapMenu();
                      },
                      book: ebook,
                      iconColor: Colors.black54,
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
