import 'package:dio/dio.dart';
import 'package:google_play_books/data/vos/books_vo.dart';
import 'package:google_play_books/network/google_api.dart';

import 'google_data_agent.dart';

class GoogleDataAgentImpl extends GoogleDataAgent {
  late GoogleApi api;

  static final GoogleDataAgentImpl _singleton = GoogleDataAgentImpl._internal();

  factory GoogleDataAgentImpl() {
    return _singleton;
  }

  GoogleDataAgentImpl._internal() {
    final dio = Dio();
    api = GoogleApi(dio);
  }

  @override
  Future<List<BooksVO>> searchBook(String text) {
    return api.searchBooks(text).then((value) {
      List<BooksVO> result = value.items!.map((element) =>  BooksVO(
        null,
        null,
        null,
        element.volumeInfo?.authors?.first,
        element.volumeInfo?.imageLinks?.thumbnail,
        null,
        null,
        element.volumeInfo?.previewLink,
        null,
        null,
        null,
        element.volumeInfo?.description,
        null,
        null,
        null,
        null,
        null,
        element.volumeInfo?.publisher,
        null,
        null,
        null,
        element.volumeInfo?.title,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        element.volumeInfo?.categories?.first,
      )).toList();
      return Future.value(result);
    });
  }
}
