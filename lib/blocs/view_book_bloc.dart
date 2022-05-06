import 'package:flutter/foundation.dart';
import 'package:google_play_books/data/models/book_model_impl.dart';

import '../data/models/book_model.dart';
import '../data/vos/books_vo.dart';

class ViewBookBloc extends ChangeNotifier {
  /// States
  bool isLoading = true;
  List<BooksVO>? viewBookList;

  /// Model
  BookModel bookModel = BookModelImpl();

  ViewBookBloc() {

    bookModel.getSaveBookList().then((value) {
      print("===============> called");
      print("=================> $value");
      viewBookList = value;
      isLoading = false;
      notifyListeners();
    }).catchError((error){
      //
    });
  }


}
