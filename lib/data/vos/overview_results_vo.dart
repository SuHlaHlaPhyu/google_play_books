import 'package:google_play_books/data/vos/books_vo.dart';
import 'package:google_play_books/data/vos/list_vo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'overview_results_vo.g.dart';

@JsonSerializable()
class OverviewResultsVO {
  @JsonKey(name: "bestsellers_date")
  String? bestsellersDate;

  @JsonKey(name: "published_date")
  String? publishedDate;

  @JsonKey(name: "published_date_description")
  String? publishedDateDescription;

  @JsonKey(name: "previous_published_date")
  String? previousPublishedDate;

  @JsonKey(name: "next_published_date")
  String? nextPublishedDate;

  @JsonKey(name: "lists")
  List<ListVO>? lists;

  @JsonKey(name: "list_name")
  String? listName;

  @JsonKey(name: "list_name_encoded")
  String? listNameEncoded;

  @JsonKey(name: "display_name")
  String? displayName;

  @JsonKey(name: "updated")
  String? updated;

  @JsonKey(name: "normal_list_ends_at")
  int? normalListEndsAt;

  @JsonKey(name: "books")
  List<BooksVO>? books;


  OverviewResultsVO(
      this.bestsellersDate,
      this.publishedDate,
      this.publishedDateDescription,
      this.previousPublishedDate,
      this.nextPublishedDate,
      this.lists,
      this.listName,
      this.listNameEncoded,
      this.displayName,
      this.updated,
      this.normalListEndsAt,
      this.books);


  @override
  String toString() {
    return 'OverviewResultsVO{bestsellersDate: $bestsellersDate, publishedDate: $publishedDate, publishedDateDescription: $publishedDateDescription, previousPublishedDate: $previousPublishedDate, nextPublishedDate: $nextPublishedDate, lists: $lists, listName: $listName, listNameEncoded: $listNameEncoded, displayName: $displayName, updated: $updated, normalListEndsAt: $normalListEndsAt, books: $books}';
  }

  factory OverviewResultsVO.fromJson(Map<String, dynamic> json) =>
      _$OverviewResultsVOFromJson(json);

  Map<String, dynamic> toJson() => _$OverviewResultsVOToJson(this);
}
