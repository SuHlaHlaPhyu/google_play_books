import 'package:flutter/material.dart';
import 'package:google_play_books/data/vos/books_vo.dart';

import 'ebook_menu_itemview.dart';
import 'icon_view.dart';

class EbookView extends StatelessWidget {
  final BooksVO? ebook;
  final Function onTapEbook;
  final bool fromLibrary;
  EbookView({
    required this.ebook,
    required this.onTapEbook,
    this.fromLibrary = false,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => onTapEbook(),
          child: Container(
            margin: const EdgeInsets.only(
              right: 8,
            ),
            height: 220,
            width: 160,
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
            child: fromLibrary
                ? Padding(
                    padding: const EdgeInsets.all(
                      8.0,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(4.5),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(
                                  3.0,
                                ),
                                shape: BoxShape.rectangle,
                              ),
                              child: const Text(
                                "Sample",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                            const Spacer(),
                            EbookMenuItemView(book: ebook,),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(),
                            const Spacer(),
                            IconView(
                              iconData: Icons.download_done,
                              onTap: () {
                                //
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: EbookMenuItemView(book: ebook,),
                    ),
                  ),
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        SizedBox(
          width: 160,
          child: GestureDetector(
            onTap: () {
              onTapEbook();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 160,
                  child: GestureDetector(
                    onTap: (){
                      onTapEbook();
                    },
                    child: Text(
                      ebook?.title ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 160,
                  child: Text(
                    ebook?.author ?? "",
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 13.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
