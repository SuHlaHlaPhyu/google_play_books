import 'package:flutter/material.dart';

import '../../dummy/ebooks.dart';
import 'icon_view.dart';

class EbookView extends StatelessWidget {
  final Ebooks? ebook;
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
                  ebook?.image ?? "",
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: fromLibrary
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
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
                            const Icon(
                              Icons.more_horiz,
                              color: Colors.white,
                              size: 32,
                            ),
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
                : const Align(
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
