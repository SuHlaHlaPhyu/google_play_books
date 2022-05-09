

import 'package:google_play_books/data/vos/books_vo.dart';


abstract class SearchModel {
  Future<List<BooksVO>> searchBook(String text);
}
