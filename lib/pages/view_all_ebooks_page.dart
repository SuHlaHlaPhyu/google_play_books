import 'package:flutter/material.dart';
import 'package:google_play_books/blocs/view_all_ebooks_bloc.dart';
import 'package:google_play_books/data/vos/books_vo.dart';
import 'package:google_play_books/viewitems/ebook_view.dart';
import 'package:provider/provider.dart';

import 'ebooks_detail_page.dart';

class ViewAllEbooksPage extends StatelessWidget {
  final String title;
  ViewAllEbooksPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ViewAllEbooksBloc(title),
      child: Scaffold(
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
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18.0,
            ),
          ),
        ),
        body: Selector<ViewAllEbooksBloc, List<BooksVO>?>(
          selector: (BuildContext context, bloc) => bloc.booksList,
          builder: (BuildContext context, bookList, Widget? child) {
            ViewAllEbooksBloc bloc = Provider.of(context, listen: false);
            if (bloc.isLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              );
            }
            return GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.70,
              ),
              itemCount: bookList?.length ?? 0,
              itemBuilder: (BuildContext ctx, index) {
                return EbookView(
                  ebook: bookList?[index],
                  onTapEbook: () {
                    // book details
                    _navigateToEbooksDetailpage(context);
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

  void _navigateToEbooksDetailpage(
    BuildContext context,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EbooksDetailPage(),
      ),
    );
  }
}
