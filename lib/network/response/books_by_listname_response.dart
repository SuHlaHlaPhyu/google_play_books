import 'package:json_annotation/json_annotation.dart';

import '../../data/vos/list_name_result_vo.dart';

part 'books_by_listname_response.g.dart';

@JsonSerializable()
class BookByListNameResponse {
  @JsonKey(name: "status")
  String? status;

  @JsonKey(name: "copyright")
  String? copyright;

  @JsonKey(name: "num_results")
  int? numResults;

  @JsonKey(name: "last_modified")
  String? lastModified;

  @JsonKey(name: "results")
  ListNameResultVO? results;


  BookByListNameResponse(this.status, this.copyright, this.numResults,
      this.lastModified, this.results);

  @override
  String toString() {
    return 'BookByListNameResponse{status: $status, copyright: $copyright, numResults: $numResults, lastModified: $lastModified, results: $results}';
  }

  factory BookByListNameResponse.fromJson(Map<String, dynamic> json) =>
      _$BookByListNameResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BookByListNameResponseToJson(this);
}
