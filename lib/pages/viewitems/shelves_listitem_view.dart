import 'package:flutter/material.dart';

import '../../dummy/ebooks.dart';
import 'shelve_title_section_view.dart';

class ShelvesListitemView extends StatelessWidget {
  final Ebooks? ebook;
  final Function onTapEbook;
  ShelvesListitemView({
    required this.ebook,
    required this.onTapEbook,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
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
            child: ShelveTitleSectionView(
              title: "10 Integration Design book to read",
              subTitle: "3 Books",
            ),
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.arrow_forward_ios_sharp,
              color: Colors.black54,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }
}
