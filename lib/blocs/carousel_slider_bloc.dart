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

    bookModel.getSaveBookListStream().listen((value) {
      viewBookList = value.reversed.toList();
      isLoading = false;
      notifyListeners();
    }).onError((error){
      //
    });
  }
}
