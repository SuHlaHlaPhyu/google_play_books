import 'package:json_annotation/json_annotation.dart';

part 'industry_identifiers_vo.g.dart';


@JsonSerializable()
class industryIdentifiersVO {
  @JsonKey(name: "type")
  String? type;

  @JsonKey(name: "identifier")
  String? identifier;

  industryIdentifiersVO(this.type, this.identifier);

  @override
  String toString() {
    return 'industryIdentifiersVO{type: $type, identifier: $identifier}';
  }

  factory industryIdentifiersVO.fromJson(Map<String, dynamic> json) =>
      _$industryIdentifiersVOFromJson(json);

  Map<String, dynamic> toJson() => _$industryIdentifiersVOToJson(this);
}
