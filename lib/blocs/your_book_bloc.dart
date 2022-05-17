import 'package:flutter/foundation.dart';
import 'package:google_play_books/data/models/book_model_impl.dart';

import '../data/models/book_model.dart';
import '../data/vos/books_vo.dart';

class YourBookBloc extends ChangeNotifier {
  /// States
  bool is3x3GridView = false;
  bool is2x2GridView = false;
  bool islistView = true;

  bool? is3x3GridLayout;
  bool? is2x2GridLayout;
  bool? islistLayout;

  var val;
  bool isLoading = true;
  List<BooksVO>? viewBookList;
  List<String?>? categoryList;
  List<BooksVO>? temp;
  List<BooksVO> tempCombined = [];

  /// Model
  BookModel bookModel = BookModelImpl();

  YourBookBloc([BookModel? bookModelTest]) {
    if(bookModelTest != null){
      bookModel = bookModelTest;
    }
    bookModel.getSaveBookList().then((value) {
      viewBookList = value;
      viewBookList?.sort((a, b) => (a.time ?? 0).compareTo(b.time ?? 0));
      categoryList = value.map((e) => e.category).toSet().toList();
      isLoading = false;
      notifyListeners();
    }).catchError((error) {
      //
    });
  }

  void setToDefault() {
    bookModel.getSaveBookList().then((value) {
      viewBookList = value;
      viewBookList?.sort((a, b) => (a.time ?? 0).compareTo(b.time ?? 0));
      categoryList = value.map((e) => e.category).toSet().toList();
      isLoading = false;
      tempCombined.clear();
      temp?.clear();
      notifyListeners();
    }).catchError((error) {
      //
    });
  }

  void getBookByCategory(String name) {
    bookModel.getSaveBookList().then((value) {
      temp = value.where((e) => e.category == name).toList();
      tempCombined += temp ?? [];
      temp?.clear();
      viewBookList = tempCombined.toSet().toList();
      notifyListeners();
    });
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
      viewBookList?.sort((a, b) => (a.time ?? 0).compareTo(b.time ?? 0));
      notifyListeners();
    } else if (index == 2) {
      viewBookList?.sort((a, b) => (a.title ?? "").compareTo(b.title ?? ""));
      notifyListeners();
    } else if (index == 3) {
      viewBookList?.sort((a, b) => (a.author ?? "").compareTo(b.author ?? ""));
      notifyListeners();
    }
  }
}
