import 'package:google_play_books/data/vos/books_vo.dart';
import 'package:google_play_books/data/vos/list_vo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_name_result_vo.g.dart';

@JsonSerializable()
class ListNameResultVO {

  @JsonKey(name: "list_name")
  String? listName;

  @JsonKey(name: "list_name_encoded")
  String? listNameEncoded;

  @JsonKey(name: "bestsellers_date")
  String? bestsellersDate;

  @JsonKey(name: "published_date")
  String? publishedDate;

  @JsonKey(name: "published_date_description")
  String? publishedDateDescription;

  @JsonKey(name: "next_published_date")
  String? nextPublishedDate;

  @JsonKey(name: "previous_published_date")
  String? previousPublishedDate;

  @JsonKey(name: "display_name")
  String? displayName;

  @JsonKey(name: "normal_list_ends_at")
  int? normalListEndsAt;

  @JsonKey(name: "updated")
  String? updated;

  @JsonKey(name: "books")
  List<BooksVO>? books;


  ListNameResultVO(
      this.listName,
      this.listNameEncoded,
      this.bestsellersDate,
      this.publishedDate,
      this.publishedDateDescription,
      this.nextPublishedDate,
      this.previousPublishedDate,
      this.displayName,
      this.normalListEndsAt,
      this.updated,
      this.books);


  @override
  String toString() {
    return 'ListNameResultVO{listName: $listName, listNameEncoded: $listNameEncoded, bestsellersDate: $bestsellersDate, publishedDate: $publishedDate, publishedDateDescription: $publishedDateDescription, nextPublishedDate: $nextPublishedDate, previousPublishedDate: $previousPublishedDate, displayName: $displayName, normalListEndsAt: $normalListEndsAt, updated: $updated, books: $books}';
  }

  factory ListNameResultVO.fromJson(Map<String, dynamic> json) =>
      _$ListNameResultVOFromJson(json);

  Map<String, dynamic> toJson() => _$ListNameResultVOToJson(this);
}
