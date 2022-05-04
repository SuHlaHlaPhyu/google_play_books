import 'package:google_play_books/data/vos/list_vo.dart';

abstract class BookModel {
   Stream<List<ListVO>?> getOverviewBooksFromDatabase();
  void getOverviewBooks();
}
