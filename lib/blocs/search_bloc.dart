import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:google_play_books/data/models/book_model.dart';
import 'package:google_play_books/data/models/book_model_impl.dart';
import 'package:google_play_books/data/models/search_model.dart';
import 'package:google_play_books/data/models/search_model_impl.dart';
import 'package:google_play_books/data/vos/books_vo.dart';

class SearchBloc extends ChangeNotifier {
  final _debouncer = Debouncer(milliseconds: 500);

  List<BooksVO> searchResult = [];
  List<BooksVO> similarBooks = [];

  bool isSearch = true;
  SearchModel searchModel = SearchModelImpl();
 // BookModel bookModel = BookModelImpl();
  SearchBloc();

  void onSearch(String text) {
    _debouncer.run(() => searchBooks(text));
  }

  void searchBooks(String text) {
    searchModel.searchBook(text).then((value) {
      searchResult = value;
      isSearch = false;
      notifyListeners();
    }).catchError((error){
    });
  }

  // void getSimilarBooks(String category) {
  //   bookModel.getBooksByListName(category).then((value) {
  //     similarBooks = value;
  //     notifyListeners();
  //   }).catchError((error){
  //   });
  // }
}

class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
