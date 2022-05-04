import 'package:google_play_books/data/vos/list_vo.dart';

abstract class PlayBooksDataAgent {
  Future<List<ListVO>?> getOverviewPlayBooks();
}