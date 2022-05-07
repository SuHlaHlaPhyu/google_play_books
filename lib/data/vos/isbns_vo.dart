import 'package:google_play_books/persistance/hive_constant.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';

part 'isbns_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_ISBNS_VO, adapterName: "IsbnsVOAdapter")
class IsbnsVO {
  @JsonKey(name: "isbn10")
  @HiveField(0)
  String? isbn10;

  @JsonKey(name: "isbn13")
  @HiveField(1)
  String? isbn13;


  IsbnsVO(this.isbn10, this.isbn13);


  @override
  String toString() {
    return 'IsbnsVO{isbn10: $isbn10, isbn13: $isbn13}';
  }

  factory IsbnsVO.fromJson(Map<String, dynamic> json) =>
      _$IsbnsVOFromJson(json);

  Map<String, dynamic> toJson() => _$IsbnsVOToJson(this);
}
