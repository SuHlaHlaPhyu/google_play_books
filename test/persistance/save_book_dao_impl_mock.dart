import 'package:google_play_books/data/vos/books_vo.dart';
import 'package:google_play_books/persistance/save_book_dao.dart';

import '../mock_data/mock_data.dart';

class SaveBookDaoImplMock extends SaveBookDao{
  Map<String?, BooksVO> booksInDatabaseMock = {};
  @override
  Stream<void> getAllBookEventStream() {
    return Stream<void>.value(null);
  }

  @override
  List<BooksVO> getAllBooks() {
    return getBookList();
  }

  @override
  Stream<List<BooksVO>> getAllBooksStream() {
    return Stream.value(getBookList());
  }

  @override
  void saveBook(BooksVO book) {
    booksInDatabaseMock[book.title] = book;
  }

}