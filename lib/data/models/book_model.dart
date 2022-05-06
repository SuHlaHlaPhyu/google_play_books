import 'package:google_play_books/data/vos/books_vo.dart';
import 'package:google_play_books/data/vos/list_vo.dart';

abstract class BookModel {
   Stream<List<ListVO>?> getOverviewBooksFromDatabase();
    void getOverviewBooks();
   Future<List<BooksVO>> getBooksByListName(String listName);
}
