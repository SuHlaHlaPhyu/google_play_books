import 'package:flutter/foundation.dart';
import 'package:google_play_books/data/models/book_model_impl.dart';

import '../data/models/book_model.dart';
import '../data/vos/books_vo.dart';

class BookDetailBloc extends ChangeNotifier {
  /// States
  BooksVO? bookDetail;
  bool isLoading = true;
  List<BooksVO>? similarBook ;

  /// Model
  BookModel bookModel = BookModelImpl();

   BookDetailBloc(String title, String category,[BookModel? bookModelTest]) {
     if(bookModelTest != null){
       bookModel = bookModelTest;
     }
    bookModel.getBookDetails(title).then((detail) {
      bookDetail = detail;
      isLoading = false;
      notifyListeners();
    }).catchError((error) {});

    /// similar books
    bookModel.getBooksByListName(category).then((result) {
      similarBook = result;
          isLoading = false;
          notifyListeners();
        }).catchError((error) {
        });
  }
}
