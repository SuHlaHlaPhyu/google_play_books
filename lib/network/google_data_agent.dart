import 'package:google_play_books/network/response/search_response.dart';

abstract class GoogleDataAgent {
  Future<SearchResponse> searchBook(String text);
}