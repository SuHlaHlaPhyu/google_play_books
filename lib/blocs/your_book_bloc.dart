import 'package:flutter/foundation.dart';
import 'package:google_play_books/data/models/book_model_impl.dart';

import '../data/models/book_model.dart';
import '../data/vos/books_vo.dart';

class YourBookBloc extends ChangeNotifier {
  /// States
  bool is3x3GridView = false;
  bool is2x2GridView = false;
  bool islistView = true;
  var val;
  bool isLoading = true;
  List<BooksVO>? viewBookList;

  /// Model
  BookModel bookModel = BookModelImpl();

  YourBookBloc() {
    bookModel.getSaveBookList().then((value) {
      viewBookList = value;
      isLoading = false;
      notifyListeners();
    }).catchError((error) {
      //
    });
  }
  void checkLayout() {
    if (islistView) {
      islistView = false;
      is2x2GridView = true;
      is3x3GridView = false;
      notifyListeners();
    } else if (is3x3GridView) {
      is3x3GridView = false;
      islistView = true;
      is2x2GridView = false;
      notifyListeners();
    } else {
      is2x2GridView = false;
      is3x3GridView = true;
      islistView = false;
      notifyListeners();
    }
  }
}
