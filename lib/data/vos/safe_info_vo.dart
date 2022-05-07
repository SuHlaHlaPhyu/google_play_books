import 'package:json_annotation/json_annotation.dart';

part 'safe_info_vo.g.dart';


@JsonSerializable()
class SafeInfoVO {
  @JsonKey(name: "country")
  String? country;

  @JsonKey(name: "saleability")
  String? saleability;

  @JsonKey(name: "isEbook")
  bool? isEbook;


  SafeInfoVO(this.country, this.saleability, this.isEbook);


  @override
  String toString() {
    return 'SafeInfoVO{country: $country, saleability: $saleability, isEbook: $isEbook}';
  }

  factory SafeInfoVO.fromJson(Map<String, dynamic> json) =>
      _$SafeInfoVOFromJson(json);

  Map<String, dynamic> toJson() => _$SafeInfoVOToJson(this);
}
