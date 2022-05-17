import 'package:google_play_books/data/vos/books_vo.dart';
import 'package:google_play_books/persistance/book_dao.dart';

import '../mock_data/mock_data.dart';

class BookDaoImplMock extends BookDao{

  Map<String?, BooksVO> booksInDatabaseMock = {};
  @override
  Stream<void> getAllBookEventStream() {
    return Stream<void>.value(null);
  }

  @override
  List<BooksVO> getAllBooks() {
    return booksInDatabaseMock.values.toList();
  }

  @override
  Stream<List<BooksVO>> getAllBooksStream() {
   return Stream.value(getBookList());
  }

  @override
  BooksVO? getBookByName(String title) {
    return getBookList().first;
  }

  @override
  Stream<BooksVO?> getBookByNameStream(String title) {
    return Stream.value(getBookList().first);
  }

  @override
  void saveAllBooks(List<BooksVO> bookList) {
    bookList.forEach((element) {
      booksInDatabaseMock[element.title ?? ""] = element;
    });
  }

}