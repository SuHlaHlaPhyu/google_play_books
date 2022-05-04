import 'package:dio/dio.dart';
import 'package:google_play_books/data/vos/list_vo.dart';
import 'package:google_play_books/network/api_constant.dart';
import 'package:google_play_books/network/play_books_api.dart';

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
    return api.getOverviewBooks(API_KEY, PUBLISHED_DATE).asStream().map((response) => response.results?.lists).first;
  }


}
