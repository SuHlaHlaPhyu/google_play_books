import 'package:flutter/foundation.dart';
import 'package:google_play_books/data/models/book_model_impl.dart';
import 'package:google_play_books/data/vos/list_vo.dart';

import '../data/models/book_model.dart';
import '../data/vos/books_vo.dart';

class HomeBloc extends ChangeNotifier {
  /// States
  List<ListVO>? overviewBooksList;
  bool isLoading = true;
  List<BooksVO>? viewBookList;

  /// Model
  BookModel bookModel = BookModelImpl();

  HomeBloc() {
    /// overview books
    bookModel.getOverviewBooksFromDatabase().listen((booklist) {
      overviewBooksList = booklist;
      isLoading = false;
      notifyListeners();
    }).onError((error) {});

    bookModel.getSaveBookList().then((value) {
      viewBookList = value;
      notifyListeners();
    }).catchError((error) {
      //
    });
  }

}
