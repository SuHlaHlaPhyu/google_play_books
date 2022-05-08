import 'package:dio/dio.dart';
import 'package:google_play_books/data/vos/list_result_vo.dart';
import 'package:google_play_books/data/vos/list_vo.dart';
import 'package:google_play_books/network/api_constant.dart';
import 'package:google_play_books/network/play_books_api.dart';

import '../data/vos/list_name_result_vo.dart';
import 'play_books_data_agent.dart';

class PlayBooksDataAgentImpl extends PlayBooksDataAgent {
  late PlayBooksApi api;

  static final PlayBooksDataAgentImpl _singleton =
      PlayBooksDataAgentImpl._internal();

  factory PlayBooksDataAgentImpl() {
    return _singleton;
  }

  PlayBooksDataAgentImpl._internal() {
    final dio = Dio();
    api = PlayBooksApi(dio);
  }

  @override
  Future<List<ListVO>?> getOverviewPlayBooks() {
    return api
        .getOverviewBooks(API_KEY, PUBLISHED_DATE)
        .asStream()
        .map((response) => response.results?.lists)
        .first;
  }

  @override
  Future<ListNameResultVO?> getBooksByListName(String listName) {
    return api
        .getBooksbyListname(
          "2013-05-22",
          listName,
          20,
          "BxCppf3ce8Q39cgPc082QKz4bWc2fngb",
        )
        .asStream()
        .map((response) => response.results)
        .first;
  }
}
