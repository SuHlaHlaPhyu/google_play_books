import 'package:flutter/foundation.dart';
import 'package:google_play_books/data/models/book_model.dart';
import 'package:google_play_books/data/models/book_model_impl.dart';
import 'package:google_play_books/data/vos/books_vo.dart';
import 'package:google_play_books/data/vos/shelf_vo.dart';

class AddToShelfBloc extends ChangeNotifier {
  ///
  List<ShelfVO>? shelfList;
  bool isDisposed = false;

  BookModel bookModel = BookModelImpl();

  AddToShelfBloc() {
    bookModel.getAllShelfStream().listen((event) {
      shelfList = event;
      checkNotifyListener();
    }).onError((error) {
      //
    });
  }

  void createShelf(ShelfVO name) {
    bookModel.createShelf(name);
    checkNotifyListener();
  }

  void selectShelf(String name) {
    var temp = shelfList?.map((element) {
      if (element.shelfName == name) {
        if (element.selected == true) {
          element.selected = false;
        } else {
          element.selected = true;
        }
      }
      return element;
    }).toList();
    shelfList = temp;
    checkNotifyListener();
  }

  void addBookToShelf(BooksVO? book) {
    bookModel.addBookToShelf( book);
    checkNotifyListener();
  }

  void checkNotifyListener() {
    if (!isDisposed) {
      notifyListeners();
    }
  }

  void clearDisposeNotify() {
    if (!isDisposed) {
      isDisposed = true;
    }
  }
}
