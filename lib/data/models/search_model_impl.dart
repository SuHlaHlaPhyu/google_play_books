import 'package:google_play_books/data/models/search_model.dart';
import 'package:google_play_books/network/google_data_agent.dart';
import 'package:google_play_books/network/google_data_agent_impl.dart';

import '../../persistance/book_dao.dart';
import '../../persistance/impl/book_dao_impl.dart';
import '../vos/books_vo.dart';

class SearchModelImpl extends SearchModel {

  GoogleDataAgent dataAgent = GoogleDataAgentImpl();

  static final SearchModelImpl _singleton = SearchModelImpl._internal();
  factory SearchModelImpl() {
    return _singleton;
  }

  SearchModelImpl._internal();


  BookDao bookDao = BookDaoImpl();


  /// for test
  void setDaosAndDataAgents(
      BookDao bookDaoTest,
      GoogleDataAgent googleDataAgentTest,
      ) {
    bookDao = bookDaoTest;
    dataAgent = googleDataAgentTest;
  }
  @override
  Future<List<BooksVO>> searchBook(String text) {
    return dataAgent.searchBook(text).then((value) {
      bookDao.saveAllBooks(value);
      return Future.value(value);
    });
  }

}