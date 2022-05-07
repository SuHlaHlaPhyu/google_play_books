import 'package:google_play_books/data/vos/list_result_vo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_response.g.dart';

@JsonSerializable()
class ListResponse {
  @JsonKey(name: "status")
  String? status;

  @JsonKey(name: "copyright")
  String? copyright;

  @JsonKey(name: "num_results")
  int? numResults;

  @JsonKey(name: "last_modified")
  String? lastModified;

  @JsonKey(name: "results")
  List<ListResultVO>? results;


  ListResponse(this.status, this.copyright, this.numResults, this.lastModified,
      this.results);


  @override
  String toString() {
    return 'ListResponse{status: $status, copyright: $copyright, numResults: $numResults, lastModified: $lastModified, results: $results}';
  }

  factory ListResponse.fromJson(Map<String, dynamic> json) =>
      _$ListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListResponseToJson(this);
}
