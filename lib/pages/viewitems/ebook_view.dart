import 'package:flutter/material.dart';

import '../../dummy/ebooks.dart';

class EbookView extends StatelessWidget {
  final Ebooks? ebook;
  final Function onTapEbook;
  EbookView({
    required this.ebook,
    required this.onTapEbook,
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
                  ebook?.image ?? "",
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: const Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.more_horiz,
                color: Colors.white,
                size: 32,
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
                Text(
                  ebook?.bookName ?? "",
                  style: const TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  ebook?.author ?? "",
                  style: const TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w300,
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
