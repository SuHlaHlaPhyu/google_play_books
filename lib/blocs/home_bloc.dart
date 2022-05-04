import 'package:flutter/foundation.dart';
import 'package:google_play_books/data/models/book_model_impl.dart';
import 'package:google_play_books/data/vos/list_vo.dart';

import '../data/models/book_model.dart';

class HomeBloc extends ChangeNotifier {
  /// States
  List<ListVO>? overviewBooksList;

  /// Model
  BookModel bookModel = BookModelImpl();

  HomeBloc() {
    /// overview books
    bookModel.getOverviewBooksFromDatabase().listen((booklist) {
      overviewBooksList = booklist;
      notifyListeners();
    }).onError((error) {});
  }
}
