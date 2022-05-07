import 'package:flutter/foundation.dart';
import 'package:google_play_books/data/models/book_model_impl.dart';

import '../data/models/book_model.dart';
import '../data/vos/books_vo.dart';

class CarouselSliderBloc extends ChangeNotifier {
  /// States
  bool isLoading = true;
  List<BooksVO>? viewBookList;

  /// Model
  BookModel bookModel = BookModelImpl();

  CarouselSliderBloc() {

    bookModel.getSaveBookList().then((value) {
      viewBookList = value;
      isLoading = false;
      notifyListeners();
    }).catchError((error){
      //
    });
  }


}
