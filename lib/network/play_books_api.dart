import 'package:dio/dio.dart';
import 'package:google_play_books/network/api_constant.dart';
import 'package:google_play_books/network/response/overview_response.dart';
import 'package:retrofit/retrofit.dart';

part 'play_books_api.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class PlayBooksApi {
  factory PlayBooksApi(Dio dio) = _PlayBooksApi;

  @GET(ENDPOINT_OVERVIEW)
  Future<OverviewResponse> getOverviewBooks(
    @Query(PARAM_API_KEY) String apiKey,
    @Query(PARAM_PUBLISHED_DATE) String published_date,
  );

  // @GET(ENDPOINT_LIST_NAME)
  // Future<MovieListResponse> getListName(
  //   @Query(PARAM_API_KEY) String apiKey,
  // );

  // @GET("$ENDPOINT_BOOKS_BY_LISTNAME/{list_name}")
  // Future<MovieVO?> getBooksbyListname(
  //   @Path("list_name") String listLame,
  //   @Query(PARAM_API_KEY) String apiKey,
  //   @Query(PARAM_OFFSET) String offset,
  // );
}
