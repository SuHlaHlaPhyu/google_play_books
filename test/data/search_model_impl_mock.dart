import 'package:google_play_books/data/models/search_model.dart';
import 'package:google_play_books/data/vos/books_vo.dart';

import '../mock_data/mock_data.dart';

class SearchModelImplMock extends SearchModel{
  @override
  Future<List<BooksVO>> searchBook(String text) {
    return Future.value(getBookList());
  }

}