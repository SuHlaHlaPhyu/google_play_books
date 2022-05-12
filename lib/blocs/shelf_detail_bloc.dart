import 'package:flutter/foundation.dart';
import 'package:google_play_books/data/models/book_model.dart';
import 'package:google_play_books/data/models/book_model_impl.dart';
import 'package:google_play_books/data/vos/shelf_vo.dart';

import '../data/vos/books_vo.dart';

class ShelfDetailBloc extends ChangeNotifier{
  ///
  ShelfVO? shelf;

  bool is3x3GridView = false;
  bool is2x2GridView = false;
  bool islistView = true;

  bool? is3x3GridLayout;
  bool? is2x2GridLayout;
  bool? islistLayout;

  bool isEdit = false;

  List<BooksVO>? bookList;

  BookModel bookModel = BookModelImpl();

  ShelfDetailBloc(String name){
    bookModel.getBookByShelfStream(name).listen((event) {
      shelf = event;
      bookList = event.books;
      notifyListeners();
    }).onError((error){
      //
    });
  }

  void editShelf(){
    isEdit = true;
    notifyListeners();
  }

  void renameShelf(int shelfId, String newName){
    bookModel.renameShelf(shelfId, newName);
    notifyListeners();
  }

  void deleteShelf(int shelfId){
    bookModel.deleteShelf(shelfId);
    notifyListeners();
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
    islistLayout = islistView;
    is2x2GridLayout = is2x2GridView;
    is3x3GridLayout = is3x3GridView;
    notifyListeners();
  }

  void sortBy(int index) {
    if (index == 1) {
      bookList?.sort((a, b) => (a.time ?? 0).compareTo(b.time ?? 0));
      notifyListeners();
    } else if (index == 2) {
      bookList?.sort((a, b) => (a.title ?? "").compareTo(b.title ?? ""));
      notifyListeners();
    } else if (index == 3) {
      bookList?.sort((a, b) => (a.author ?? "").compareTo(b.author ?? ""));
      notifyListeners();
    }
  }

}