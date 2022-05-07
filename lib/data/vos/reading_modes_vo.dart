import 'package:json_annotation/json_annotation.dart';

part 'reading_modes_vo.g.dart';


@JsonSerializable()
class ReadingModesVO {
  @JsonKey(name: "text")
  bool? text;

  @JsonKey(name: "image")
  bool? image;


  ReadingModesVO(this.text, this.image);

  @override
  String toString() {
    return 'ReadingModesVO{text: $text, image: $image}';
  }

  factory ReadingModesVO.fromJson(Map<String, dynamic> json) =>
      _$ReadingModesVOFromJson(json);

  Map<String, dynamic> toJson() => _$ReadingModesVOToJson(this);
}
