

import '../../network/response/search_response.dart';

abstract class SearchModel {
  Future<SearchResponse> searchBook(String text);
}
