import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:google_play_books/data/models/search_model.dart';
import 'package:google_play_books/data/models/search_model_impl.dart';

import '../network/response/search_response.dart';

class SearchBloc extends ChangeNotifier {
  final _debouncer = Debouncer(milliseconds: 500);

  SearchResponse? searchResponse;

  SearchModel bookModel = SearchModelImpl();
  SearchBloc();

  void onSearch(String text) {
    _debouncer.run(() => searchBooks(text));
  }

  void searchBooks(String text) {
    bookModel.searchBook("flutter").then((value) {
      searchResponse = value;
      print("==============> search result $value");
      notifyListeners();
    }).catchError((error){
      print("==============> error search $error");
    });
  }
}

class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
