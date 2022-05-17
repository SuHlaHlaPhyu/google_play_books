
import 'package:flutter/material.dart';
import 'package:google_play_books/data/vos/books_vo.dart';

import '../viewitems/ebook_listitem_view.dart';
import '../viewitems/ebooks_list_section_view.dart';
import 'add_to_shelf_page.dart';
import 'ebooks_detail_page.dart';

class SearchResultPage extends StatelessWidget {
  Map<String?, List<BooksVO>> searchList;
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
          horizontal: 5,
        ),
        itemCount: searchList.keys.toList().length,
        itemBuilder: (context, index) {
         return EbooksListSectionView(
           searchList.keys.toList()[index] ?? " ",
            ebookList: searchList.values.toList()[index],
            onTapEbook: (bookIndex) {
              //
            },
            onTapViewAll: () {
             //
            },
            onTapMenu: (index){
             //
            },
          );
        },
      ),
    );
  }
  void _navigateToEbooksDetailpage(BuildContext context, String bookName, String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EbooksDetailPage(
          title: bookName,
          category: category,
        ),
      ),
    );
  }
  showModalBottomSheetMenuView(BuildContext context,BooksVO? book) {
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
                      builder: (context) => AddToShelfPage(book: book,),
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
