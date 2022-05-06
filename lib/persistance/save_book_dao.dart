import 'package:google_play_books/data/vos/books_vo.dart';

abstract class SaveBookDao {
  void saveBook(BooksVO book);
  Stream<void> getAllBookEventStream();
  List<BooksVO> getAllBooks();
  Stream<List<BooksVO>> getAllBooksStream();
}
