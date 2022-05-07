import 'package:dio/dio.dart';
import 'package:google_play_books/network/google_api.dart';
import 'package:google_play_books/network/response/search_response.dart';

import 'google_data_agent.dart';

class GoogleDataAgentImpl extends GoogleDataAgent {
  late GoogleApi api;

  static final GoogleDataAgentImpl _singleton =
  GoogleDataAgentImpl._internal();

  factory GoogleDataAgentImpl() {
    return _singleton;
  }

  GoogleDataAgentImpl._internal() {
    final dio = Dio();
    api = GoogleApi(dio);
  }

  @override
  Future<SearchResponse> searchBook(String text) {
    return api.searchBooks("flutter").then((value) {
      print("===============>search $value");
      return Future.value(value);
    });
  }
}
