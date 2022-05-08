import 'package:flutter/foundation.dart';
import 'package:google_play_books/data/models/book_model_impl.dart';
import 'package:google_play_books/data/vos/books_vo.dart';

import '../data/models/book_model.dart';

class ViewAllEbooksBloc extends ChangeNotifier {
  /// States
  List<BooksVO>? booksList;
  bool isLoading = true;

  /// Model
  BookModel bookModel = BookModelImpl();

  ViewAllEbooksBloc(String listName) {
    /// overview books
    bookModel.getBooksByListName(listName).then((result) {
      booksList = result;
      isLoading = false;
      notifyListeners();
    }).catchError((error) {
    });
  }
}