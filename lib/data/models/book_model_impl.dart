import 'dart:math';

import 'package:google_play_books/data/models/book_model.dart';
import 'package:google_play_books/data/vos/books_vo.dart';
import 'package:google_play_books/data/vos/list_vo.dart';
import 'package:google_play_books/data/vos/shelf_vo.dart';
import 'package:google_play_books/network/play_books_data_agent.dart';
import 'package:google_play_books/network/play_books_data_agent_impl.dart';
import 'package:google_play_books/persistance/book_dao.dart';
import 'package:google_play_books/persistance/book_list_dao.dart';
import 'package:google_play_books/persistance/impl/book_dao_impl.dart';
import 'package:google_play_books/persistance/impl/book_list_dao_impl.dart';
import 'package:google_play_books/persistance/impl/save_book_dao_impl.dart';
import 'package:google_play_books/persistance/impl/shelf_dao_impl.dart';
import 'package:google_play_books/persistance/save_book_dao.dart';
import 'package:google_play_books/persistance/shelf_dao.dart';
import 'package:stream_transform/stream_transform.dart';

class BookModelImpl extends BookModel {
  PlayBooksDataAgent dataAgent = PlayBooksDataAgentImpl();

  static final BookModelImpl _singleton = BookModelImpl._internal();
  factory BookModelImpl() {
    return _singleton;
  }

  BookModelImpl._internal();
  BookDao bookDao = BookDaoImpl();
  SaveBookDao saveBookDao = SaveBookDaoImpl();
  BookListDao bookListDao = BookListDaoImpl();
  ShelfDao shelfDao = ShelfDaoImpl();

  @override
  void getOverviewBooks() {
    dataAgent.getOverviewPlayBooks().then((value) async {
      /// save book by list name
      bookListDao.saveAllBooks(value ?? []);

      /// save book obj only
      value?.forEach((element) {
        List<BooksVO> bookList = element.books?.map((e) {
              e.category = element.listName;
              return e;
            }).toList() ??
            [];
        bookDao.saveAllBooks(bookList);
      });
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
  Future<BooksVO?> getBookDetails(String name) async {
    return Future.value(bookDao.getBookByNameStream(name).first.then((value) {
      value?.time = DateTime.now().millisecondsSinceEpoch;
      saveBookDao.saveBook(value!);
      return value;
    }));
  }

  @override
  Future<List<BooksVO>> getSaveBookList() {
    return Future.value(saveBookDao.getAllBooks());
  }

  @override
  Stream<List<BooksVO>> getSaveBookListStream() {
    return saveBookDao
        .getAllBookEventStream()
        .startWith(saveBookDao.getAllBooksStream())
        .map((event) => saveBookDao.getAllBooks());
  }

  @override
  Stream<List<ListVO>?> getOverviewBooksFromDatabase() {
    getOverviewBooks();
    return bookListDao
        .getAllBookEventStream()
        .startWith(bookListDao.getAllBooksStream())
        .map((event) => bookListDao.getAllBooks());
  }

  @override
  void addBookToShelf(BooksVO? book) {
    shelfDao.addBookToShelf(book);
  }

  @override
  void createShelf(ShelfVO shelf) {
    shelfDao.createShelf(shelf);
  }

  @override
  Stream<List<ShelfVO>> getAllShelfStream() {
    return shelfDao
        .getAllShelfEventStream()
        .startWith(shelfDao.getAllShelfStream())
        .map((event) => shelfDao.getAllShelf());
  }

  @override
  Stream<ShelfVO> getBookByShelfStream(String name) {
    return shelfDao
        .getAllShelfEventStream()
        .startWith(shelfDao.getBookByShelfStream(name))
        .map((event) => shelfDao.getBookByShelf(name));
  }
}
