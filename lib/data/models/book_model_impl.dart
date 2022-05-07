import 'package:google_play_books/data/models/book_model.dart';
import 'package:google_play_books/data/vos/books_vo.dart';
import 'package:google_play_books/data/vos/list_result_vo.dart';
import 'package:google_play_books/data/vos/list_vo.dart';
import 'package:google_play_books/network/play_books_data_agent.dart';
import 'package:google_play_books/network/play_books_data_agent_impl.dart';
import 'package:google_play_books/persistance/book_dao.dart';
import 'package:google_play_books/persistance/impl/book_dao_impl.dart';
import 'package:google_play_books/persistance/impl/save_book_dao_impl.dart';
import 'package:google_play_books/persistance/save_book_dao.dart';

class BookModelImpl extends BookModel {
  PlayBooksDataAgent dataAgent = PlayBooksDataAgentImpl();

  static final BookModelImpl _singleton = BookModelImpl._internal();
  factory BookModelImpl() {
    return _singleton;
  }

  BookModelImpl._internal();
  BookDao bookDao = BookDaoImpl();
  SaveBookDao saveBookDao = SaveBookDaoImpl();

  @override
  Future<List<ListVO>?> getOverviewBooks() {
   return dataAgent.getOverviewPlayBooks().then((value) async {
      value?.forEach((element) {
        bookDao.saveAllBooks(element.books ?? []);
      });
     return Future.value(value);
    });
  }

  @override
  Future<List<BooksVO>> getBooksByListName(String listName) async {
   return dataAgent.getBooksByListName(listName).then((value) {
     bookDao.saveAllBooks(value?.books ?? []);
     return Future.value(value?.books);
   });
  }

  @override
  Future<BooksVO?> getBookDetails(String name) async{
    return Future.value(bookDao.getBookByNameStream(name).first.then((value) {
     saveBookDao.saveBook(value!);
      return value;
    }));
  }

  @override
  Future<List<BooksVO>> getSaveBookList() {
    return Future.value(saveBookDao.getAllBooks());
  }

  @override
  Future<List<ListResultVO>?> getBookByList(String name) {
    return dataAgent.getBookByList(name).then((value) {
      print("==================> $value");
      return Future.value(value);
    });
  }

}
