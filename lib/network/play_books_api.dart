import 'package:dio/dio.dart';
import 'package:google_play_books/network/api_constant.dart';
import 'package:google_play_books/network/response/books_by_listname_response.dart';
import 'package:google_play_books/network/response/overview_response.dart';
import 'package:retrofit/retrofit.dart';

part 'play_books_api.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class PlayBooksApi {
  factory PlayBooksApi(Dio dio) = _PlayBooksApi;

  @GET(ENDPOINT_OVERVIEW)
  Future<OverviewResponse> getOverviewBooks(
    @Query(PARAM_API_KEY) String apiKey,
    @Query(PARAM_PUBLISHED_DATE) String publishedDate,
  );

  @GET("/v3/lists/{date}/{list_name}.json")
  Future<BookByListNameResponse> getBooksbyListname(
    @Path("date") String date,
    @Path("list_name") String listName,
    @Query("offset") int offset,
    @Query("api-key") String apiKey,
  );
}
