import 'package:google_play_books/data/vos/books_vo.dart';
import 'package:google_play_books/data/vos/isbns_vo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_result_vo.g.dart';

@JsonSerializable()
class ListResultVO {
  @JsonKey(name: "list_name")
  String? listName;

  @JsonKey(name: "display_name")
  String? displayName;

  @JsonKey(name: "bestsellers_date")
  String? bestsellersDate;

  @JsonKey(name: "published_date")
  String? publishedDate;

  @JsonKey(name: "rank")
  int? rank;

  @JsonKey(name: "rank_last_week")
  int? rankLastWeek;

  @JsonKey(name: "weeks_on_list")
  int? weeksOnList;

  @JsonKey(name: "asterisk")
  int? asterisk;

  @JsonKey(name: "dagger")
  int? dagger;

  @JsonKey(name: "amazon_product_url")
  String? amazonProductUrl;

  @JsonKey(name: "isbns")
  List<IsbnsVO>? isbns;

  @JsonKey(name: "book_details")
  List<BooksVO>? bookDetails;

  @JsonKey(name: "reviews")
  List<ListResultVO>? reviews;


  ListResultVO(
      this.listName,
      this.displayName,
      this.bestsellersDate,
      this.publishedDate,
      this.rank,
      this.rankLastWeek,
      this.weeksOnList,
      this.asterisk,
      this.dagger,
      this.amazonProductUrl,
      this.isbns,
      this.bookDetails,
      this.reviews);


  @override
  String toString() {
    return 'ListResultVO{listName: $listName, displayName: $displayName, bestsellersDate: $bestsellersDate, publishedDate: $publishedDate, rank: $rank, rankLastWeek: $rankLastWeek, weeksOnList: $weeksOnList, asterisk: $asterisk, dagger: $dagger, amazonProductUrl: $amazonProductUrl, isbns: $isbns, bookDetails: $bookDetails, reviews: $reviews}';
  }

  factory ListResultVO.fromJson(Map<String, dynamic> json) =>
      _$ListResultVOFromJson(json);

  Map<String, dynamic> toJson() => _$ListResultVOToJson(this);
}
