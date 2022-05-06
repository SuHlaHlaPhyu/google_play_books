import 'package:google_play_books/data/models/book_model.dart';
import 'package:google_play_books/data/vos/books_vo.dart';
import 'package:google_play_books/data/vos/list_vo.dart';
import 'package:google_play_books/network/play_books_data_agent.dart';
import 'package:google_play_books/network/play_books_data_agent_impl.dart';
import 'package:google_play_books/persistance/impl/overview_dao_impl.dart';
import 'package:google_play_books/persistance/overview_dao.dart';
import 'package:stream_transform/stream_transform.dart';

class BookModelImpl extends BookModel {
  PlayBooksDataAgent dataAgent = PlayBooksDataAgentImpl();

  static final BookModelImpl _singleton = BookModelImpl._internal();
  factory BookModelImpl() {
    return _singleton;
  }

  BookModelImpl._internal();
  OverviewDao overviewDao = OverviewDaoImpl();

  @override
  void getOverviewBooks() {
    dataAgent.getOverviewPlayBooks().then((value) async {
      overviewDao.saveAllBooks(value ?? []);
    });
  }

  @override
  Stream<List<ListVO>?> getOverviewBooksFromDatabase() {
    getOverviewBooks();
    return overviewDao
        .getAllBookEventStream()
        .startWith(overviewDao.getAllBooksStream())
        .map((event) => overviewDao.getAllBooks());
  }

  @override
  Future<List<BooksVO>> getBooksByListName(String listName) {
   return dataAgent.getBooksByListName(listName).then((value) => Future.value(value?.books));
  }
}
