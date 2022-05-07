import 'package:dio/dio.dart';
import 'package:google_play_books/network/api_constant.dart';
import 'package:google_play_books/network/response/search_response.dart';
import 'package:retrofit/retrofit.dart';

part 'google_api.g.dart';

@RestApi(baseUrl: BASE_URL_GOOGLE_API)
abstract class GoogleApi {
  factory GoogleApi(Dio dio) = _GoogleApi;

  @GET(ENDPOINT_SEARCH)
  Future<SearchResponse> searchBooks(
      @Query(PARAM_Q) String q,
      );
}
