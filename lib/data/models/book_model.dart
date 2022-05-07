import 'package:google_play_books/data/vos/books_vo.dart';
import 'package:google_play_books/data/vos/list_result_vo.dart';
import 'package:google_play_books/data/vos/list_vo.dart';

abstract class BookModel {
   Future<List<ListVO>?> getOverviewBooks();
   Future<List<BooksVO>> getBooksByListName(String listName);
   Future<BooksVO?> getBookDetails(String name);
   Future<List<BooksVO>> getSaveBookList();
   Future<List<ListResultVO>?> getBookByList(String name);
}
