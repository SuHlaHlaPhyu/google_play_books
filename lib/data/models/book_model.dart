import 'package:google_play_books/data/vos/books_vo.dart';
import 'package:google_play_books/data/vos/list_vo.dart';

import '../vos/shelf_vo.dart';

abstract class BookModel {
  void getOverviewBooks();
  Future<List<BooksVO>> getBooksByListName(String listName);
  Future<BooksVO?> getBookDetails(String name);
  Future<List<BooksVO>> getSaveBookList();
  Stream<List<BooksVO>> getSaveBookListStream();
  Stream<List<ListVO>?> getOverviewBooksFromDatabase();

  /// shelf

  void createShelf(ShelfVO shelf);
  void addBookToShelf(BooksVO? book);
  Stream<List<ShelfVO>> getAllShelfStream();
  Stream<ShelfVO> getBookByShelfStream(String name);

  /// rename shelf
  Future<ShelfVO> renameShelf(int shelfId, String newName);
}
