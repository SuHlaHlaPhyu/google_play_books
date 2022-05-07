import 'package:google_play_books/data/models/search_model.dart';
import 'package:google_play_books/network/google_data_agent.dart';
import 'package:google_play_books/network/google_data_agent_impl.dart';
import 'package:google_play_books/network/response/search_response.dart';

class SearchModelImpl extends SearchModel {

  GoogleDataAgent dataAgent = GoogleDataAgentImpl();

  static final SearchModelImpl _singleton = SearchModelImpl._internal();
  factory SearchModelImpl() {
    return _singleton;
  }

  SearchModelImpl._internal();
  @override
  Future<SearchResponse> searchBook(String text) {
    return dataAgent.searchBook(text).then((value) {
      print("===============> se data $value");
      return Future.value(value);
    });
  }

}