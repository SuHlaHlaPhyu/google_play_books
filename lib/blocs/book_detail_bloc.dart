import 'package:flutter/foundation.dart';
import 'package:google_play_books/data/models/book_model_impl.dart';

import '../data/models/book_model.dart';
import '../data/vos/books_vo.dart';

class BookDetailBloc extends ChangeNotifier {
  /// States
   BooksVO? bookDetail;
  bool isLoading = true;

  /// Model
  BookModel bookModel = BookModelImpl();

   BookDetailBloc(String title) {
    /// overview books
    bookModel.getBookDetails(title).then((detail) {
      bookDetail = detail;
      print("detail==================> $detail");
      isLoading = false;
      notifyListeners();
    }).catchError((error) {});
  }
}
