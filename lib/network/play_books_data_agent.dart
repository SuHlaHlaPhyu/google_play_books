import 'package:google_play_books/data/vos/list_result_vo.dart';
import 'package:google_play_books/data/vos/list_vo.dart';
import 'package:google_play_books/data/vos/overview_results_vo.dart';

abstract class PlayBooksDataAgent {
  Future<List<ListVO>?> getOverviewPlayBooks();

  Future<OverviewResultsVO?> getBooksByListName(String listName);

  Future<List<ListResultVO>?> getBookByList(String name);
}