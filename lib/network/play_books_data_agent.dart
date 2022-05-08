import 'package:google_play_books/data/vos/list_result_vo.dart';
import 'package:google_play_books/data/vos/list_vo.dart';

import '../data/vos/list_name_result_vo.dart';

abstract class PlayBooksDataAgent {
  Future<List<ListVO>?> getOverviewPlayBooks();

  Future<ListNameResultVO?> getBooksByListName(String listName);

}