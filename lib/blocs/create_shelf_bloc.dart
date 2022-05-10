import 'package:flutter/foundation.dart';
import 'package:google_play_books/data/models/book_model.dart';
import 'package:google_play_books/data/models/book_model_impl.dart';
import 'package:google_play_books/data/vos/books_vo.dart';
import 'package:google_play_books/data/vos/shelf_vo.dart';

class CreateShelfBloc extends ChangeNotifier{
  ///
  List<ShelfVO>? shelfList;

  BookModel bookModel = BookModelImpl();

  CreateShelfBloc();

  void createShelf(ShelfVO name){
    bookModel.createShelf(name);
    print("============> bloc add");
    notifyListeners();
  }

  // void addBookToShelf(String shelfName, BooksVO book){
  //   bookModel.addBookToShelf(shelfName, book);
  //   notifyListeners();
  // }
}