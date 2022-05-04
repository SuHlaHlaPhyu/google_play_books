import 'package:google_play_books/persistance/hive_constant.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';

part 'buy_links_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_BUY_LINK_VO, adapterName: "BuyLinkVOAdapter")
class BuyLinksVO {
  @JsonKey(name: "name")
  @HiveField(0)
  String? name;

  @JsonKey(name: "url")
  @HiveField(1)
  String? url;

  BuyLinksVO(this.name, this.url);

  @override
  String toString() {
    return 'BuyLinksVO{name: $name, url: $url}';
  }

  factory BuyLinksVO.fromJson(Map<String, dynamic> json) =>
      _$BuyLinksVOFromJson(json);

  Map<String, dynamic> toJson() => _$BuyLinksVOToJson(this);
}
