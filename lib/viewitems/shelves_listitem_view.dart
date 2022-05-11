import 'package:flutter/material.dart';

import '../../dummy/ebooks.dart';
import '../data/vos/shelf_vo.dart';
import 'shelve_title_section_view.dart';

class ShelvesListitemView extends StatelessWidget {
  final ShelfVO? shelf;
  final Function onTapEbook;
  final Function(String?) onTapViewAll;
  final int total;
  final bool selectShelf;
  ShelvesListitemView({
    required this.shelf,
    required this.onTapEbook,
    required this.onTapViewAll,
    required this.total,
    this.selectShelf = false,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          shelf!.books!.isEmpty || shelf?.books == []
              ? Container()
              : GestureDetector(
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
                          shelf?.books?.last.bookImage ??
                              "https://bookstoreromanceday.org/wp-content/uploads/2020/08/book-cover-placeholder.png",
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
              onTapViewAll(shelf?.shelfName ?? "");
            },
            child: ShelveTitleSectionView(
              title: shelf?.shelfName ?? "",
              subTitle: total.toString() + " Books",
            ),
          ),
          const Spacer(),
          selectShelf
              ? GestureDetector(
                  onTap: () {
                    onTapEbook(shelf?.shelfName ?? "");
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: shelf?.selected == true ? const Icon(
                      Icons.check_box_outlined,
                      color: Colors.blue,
                      size: 18,
                    ) :const Icon(
                      Icons.check_box_outline_blank,
                      color: Colors.black54,
                      size: 18,
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    onTapViewAll(shelf?.shelfName ?? "");
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Colors.black54,
                      size: 18,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
