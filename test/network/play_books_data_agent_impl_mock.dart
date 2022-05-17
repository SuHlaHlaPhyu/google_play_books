import 'package:google_play_books/data/vos/list_name_result_vo.dart';
import 'package:google_play_books/data/vos/list_vo.dart';
import 'package:google_play_books/network/play_books_data_agent.dart';

import '../mock_data/mock_data.dart';

class PlayBooksDataAgentImplMock extends PlayBooksDataAgent{
  @override
  Future<ListNameResultVO?> getBooksByListName(String listName) {
    return Future.value(getViewAllBooksMock().first);
  }

  @override
  Future<List<ListVO>?> getOverviewPlayBooks() {
    return Future.value(getOverViewBooksMock());
  }

}