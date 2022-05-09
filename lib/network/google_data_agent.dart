import '../data/vos/books_vo.dart';

abstract class GoogleDataAgent {
  Future<List<BooksVO>> searchBook(String text);
}