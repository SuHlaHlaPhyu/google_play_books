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
  bool isDisposed = false;

  List<BooksVO>? bookList;
  List<String?>? categoryList;


  BookModel bookModel = BookModelImpl();

  ShelfDetailBloc(String name,[BookModel? bookModelTest]){
    if(bookModelTest != null){
      bookModel = bookModelTest;
    }
    bookModel.getBookByShelfStream(name).listen((event) {
      shelf = event;
      bookList = event.books;
      categoryList = event.books?.map((e) => e.category).toList();
      print("=======================> $categoryList");
      checkNotifyListener();
    }).onError((error){
      //
    });
  }

  void editShelf(){
    isEdit = true;
    checkNotifyListener();
  }

  void renameShelf(int shelfId, String newName){
    bookModel.renameShelf(shelfId, newName);
    checkNotifyListener();
  }

  void deleteShelf(int shelfId){
    bookModel.deleteShelf(shelfId);
    checkNotifyListener();
  }

  void checkLayout() {
    if (islistView) {
      islistView = false;
      is2x2GridView = true;
      is3x3GridView = false;
      checkNotifyListener();
    } else if (is3x3GridView) {
      is3x3GridView = false;
      islistView = true;
      is2x2GridView = false;
      checkNotifyListener();
    } else {
      is2x2GridView = false;
      is3x3GridView = true;
      islistView = false;
      checkNotifyListener();
    }
    islistLayout = islistView;
    is2x2GridLayout = is2x2GridView;
    is3x3GridLayout = is3x3GridView;
    checkNotifyListener();
  }

  void sortBy(int index) {
    if (index == 1) {
      bookList?.sort((a, b) => (a.time ?? 0).compareTo(b.time ?? 0));
      checkNotifyListener();
    } else if (index == 2) {
      bookList?.sort((a, b) => (a.title ?? "").compareTo(b.title ?? ""));
      checkNotifyListener();
    } else if (index == 3) {
      bookList?.sort((a, b) => (a.author ?? "").compareTo(b.author ?? ""));
      checkNotifyListener();
    }
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