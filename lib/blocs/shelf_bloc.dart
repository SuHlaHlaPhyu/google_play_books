import 'package:flutter/foundation.dart';
import 'package:google_play_books/data/models/book_model.dart';
import 'package:google_play_books/data/models/book_model_impl.dart';
import 'package:google_play_books/data/vos/books_vo.dart';
import 'package:google_play_books/data/vos/shelf_vo.dart';

class ShelfBloc extends ChangeNotifier{
  ///
  List<ShelfVO>? shelfList;

  BookModel bookModel = BookModelImpl();

  ShelfBloc(){
    bookModel.getAllShelfStream().listen((event) {
      shelfList = event;
      notifyListeners();
    }).onError((error){
      //
    });
  }

  void createShelf(ShelfVO name){
    bookModel.createShelf(name);
    notifyListeners();
  }

  void addBookToShelf(String shelfName, BooksVO book){
    bookModel.addBookToShelf(shelfName, book);
    notifyListeners();
  }
}