import 'package:google_play_books/data/vos/overview_results_vo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'overview_response.g.dart';

@JsonSerializable()
class OverviewResponse {
  @JsonKey(name: "status")
  String? status;

  @JsonKey(name: "copyright")
  String? copyright;

  @JsonKey(name: "num_results")
  int? numResults;

  @JsonKey(name: "last_modified")
  String? lastModified;

  @JsonKey(name: "results")
  OverviewResultsVO? results;

  OverviewResponse(this.status, this.copyright, this.numResults,this.lastModified, this.results);

  @override
  String toString() {
    return 'OverviewResponse{status: $status, copyright: $copyright, numResults: $numResults ,lastModified: $lastModified, results: $results}';
  }

  factory OverviewResponse.fromJson(Map<String, dynamic> json) =>
      _$OverviewResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OverviewResponseToJson(this);
}
