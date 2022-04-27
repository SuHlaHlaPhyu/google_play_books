import 'package:flutter/material.dart';
import 'package:google_play_books/dummy/ebooks.dart';
import 'package:google_play_books/pages/viewitems/ebook_view.dart';

class ViewAllEbooksPage extends StatefulWidget {
  final List<Ebooks>? ebooksList;
  final String title;
  ViewAllEbooksPage({required this.ebooksList, required this.title});
  @override
  State<ViewAllEbooksPage> createState() => _ViewAllEbooksPageState();
}

class _ViewAllEbooksPageState extends State<ViewAllEbooksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        titleSpacing: 0.0,
        backgroundColor: Colors.white,
        centerTitle: false,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 18,
          ),
        ),
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18.0,
          ),
        ),
      ),
      body: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.70,
        ),
        itemCount: widget.ebooksList?.length ?? 0,
        itemBuilder: (BuildContext ctx, index) {
          return EbookView(
            ebook: widget.ebooksList?[index],
            onTapEbook: () {
              // book details
            },
          );
        },
      ),
    );
  }
}
