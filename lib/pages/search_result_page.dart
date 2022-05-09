
import 'package:flutter/material.dart';
import 'package:google_play_books/data/vos/books_vo.dart';

import '../viewitems/ebook_listitem_view.dart';
import 'ebooks_detail_page.dart';

class SearchResultPage extends StatelessWidget {
  List<BooksVO> searchList;
  SearchResultPage({required this.searchList});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0.0,
        titleSpacing: 0.0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.keyboard_backspace,
            color: Colors.blue,
          ),
        ),
        title: const Text("Result",style: TextStyle(color: Colors.black,fontSize: 18),),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        itemCount: searchList?.length,
        itemBuilder: (context, index) {
          return EbookListitemView(
            isSearch: true,
            ebook: searchList?[index],
            onTapEbook: () {
              _navigateToEbooksDetailpage(context,searchList?[index].title ?? "");
            },
          );
        },
      ),
    );
  }
  void _navigateToEbooksDetailpage(BuildContext context, String bookName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EbooksDetailPage(
          title: bookName,
        ),
      ),
    );
  }
}
