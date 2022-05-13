import 'package:flutter/foundation.dart';
import 'package:google_play_books/data/models/book_model.dart';
import 'package:google_play_books/data/models/book_model_impl.dart';
import 'package:google_play_books/data/vos/shelf_vo.dart';

class ShelfBloc extends ChangeNotifier{
  ///
  List<ShelfVO>? shelfList;

  BookModel bookModel = BookModelImpl();
  bool isDisposed = false;
  ShelfBloc(){
    bookModel.getAllShelfStream().listen((event) {
      shelfList = event;
      checkNotifyListener();
    }).onError((error){
      //
    });
  }

  void createShelf(ShelfVO name){
    bookModel.createShelf(name);
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