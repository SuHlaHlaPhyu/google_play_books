import 'package:flutter/material.dart';

import '../../dummy/ebooks.dart';

class EbookListitemView extends StatelessWidget {
  final Ebooks? ebook;
  final Function onTapEbook;
  EbookListitemView({
    required this.ebook,
    required this.onTapEbook,
  });
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
                    ebook?.image ?? "",
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
          const Spacer(),
          Row(
            children: const [
              Icon(
                Icons.download_done,
                color: Colors.black54,
                size: 18,
              ),
              SizedBox(
                width: 35.0,
              ),
              Icon(
                Icons.more_horiz,
                color: Colors.black54,
                size: 25,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
