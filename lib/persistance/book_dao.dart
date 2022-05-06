import 'package:google_play_books/data/vos/books_vo.dart';

abstract class BookDao {
  void saveAllBooks(List<BooksVO> bookList);
  Stream<void> getAllBookEventStream();
  List<BooksVO> getAllBooks();
  Stream<List<BooksVO>> getAllBooksStream();
  BooksVO? getBookByName(String title);
 Stream<BooksVO?> getBookByNameStream(String title);
}
