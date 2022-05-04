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


  OverviewResultsVO(
      this.bestsellersDate,
      this.publishedDate,
      this.publishedDateDescription,
      this.previousPublishedDate,
      this.nextPublishedDate,
      this.lists);

  @override
  String toString() {
    return 'OverviewResultsVO{bestsellersDate: $bestsellersDate, publishedDate: $publishedDate, publishedDateDescription: $publishedDateDescription, previousPublishedDate: $previousPublishedDate, nextPublishedDate: $nextPublishedDate, lists: $lists}';
  }

  factory OverviewResultsVO.fromJson(Map<String, dynamic> json) =>
      _$OverviewResultsVOFromJson(json);

  Map<String, dynamic> toJson() => _$OverviewResultsVOToJson(this);
}
