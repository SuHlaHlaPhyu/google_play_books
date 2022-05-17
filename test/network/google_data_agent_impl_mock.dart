import 'package:google_play_books/data/vos/books_vo.dart';
import 'package:google_play_books/network/google_data_agent.dart';

import '../mock_data/mock_data.dart';

class GoogleDataAgentImplMock extends GoogleDataAgent{
  @override
  Future<List<BooksVO>> searchBook(String text) {
    return Future.value(getBookList());
  }

}