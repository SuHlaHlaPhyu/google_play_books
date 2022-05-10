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
   void addBookToShelf(String shelfName,BooksVO book);
   Stream<List<ShelfVO>> getAllShelfStream();
}
