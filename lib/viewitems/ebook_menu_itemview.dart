import 'package:flutter/material.dart';

import '../data/vos/books_vo.dart';
import '../pages/add_to_shelf_page.dart';

class EbookMenuItemView extends StatefulWidget {
  Color iconColor;
  BooksVO? book;
  EbookMenuItemView({
    this.iconColor = Colors.white,
    required this.book,
  });

  @override
  State<EbookMenuItemView> createState() => _EbookMenuItemViewState();
}

class _EbookMenuItemViewState extends State<EbookMenuItemView> {
  var val;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheetView(context);
      },
      child: Icon(
        Icons.more_horiz,
        color: widget.iconColor,
        key: const ValueKey("menu"),
      ),
    );
  }

  showModalBottomSheetView(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Divider(),
              ListTile(
                contentPadding: const EdgeInsets.all(0.0),
                minLeadingWidth: 5.0,
                minVerticalPadding: 0.0,
                leading: const Icon(Icons.remove),
                title: const Text('Remove download'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(0.0),
                minLeadingWidth: 5.0,
                minVerticalPadding: 0.0,
                leading: const Icon(Icons.delete),
                title: const Text('Delete from library'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                key: const ValueKey("add"),
                contentPadding: const EdgeInsets.all(0.0),
                minLeadingWidth: 5.0,
                minVerticalPadding: 0.0,
                leading: const Icon(Icons.add),
                title: const Text('Add to shelf'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddToShelfPage(book: widget.book,),
                    ),
                  );
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(0.0),
                minLeadingWidth: 5.0,
                minVerticalPadding: 0.0,
                leading: const Icon(Icons.bookmark),
                title: const Text('About this ebook'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Container(
                height: 35,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: const Center(
                  child: Text(
                    "Buy \$4.9",
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
            ],
          ),
        );
      },
    );
  }
}
