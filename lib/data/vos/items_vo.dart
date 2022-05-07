import 'package:google_play_books/data/vos/safe_info_vo.dart';
import 'package:google_play_books/data/vos/search_info_vo.dart';
import 'package:google_play_books/data/vos/volume_info_vo.dart';
import 'package:json_annotation/json_annotation.dart';

import 'access_info_vo.dart';

part 'items_vo.g.dart';

@JsonSerializable()
class ItemsVO {
  @JsonKey(name: "kind")
  String? kind;

  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "etag")
  String? etag;

  @JsonKey(name: "selfLink")
  String? selfLink;

  @JsonKey(name: "volumeInfo")
  VolumeInfoVO? volumeInfo;

  @JsonKey(name: "saleInfo")
  SafeInfoVO? saleInfo;

  @JsonKey(name: "accessInfo")
  AccessInfoVO? accessInfo;

  @JsonKey(name: "searchInfo")
  SearchInfoVO? searchInfo;


  ItemsVO(this.kind, this.id, this.etag, this.selfLink, this.volumeInfo,
      this.saleInfo, this.accessInfo, this.searchInfo);


  @override
  String toString() {
    return 'ItemsVO{kind: $kind, id: $id, etag: $etag, selfLink: $selfLink, volumeInfo: $volumeInfo, saleInfo: $saleInfo, accessInfo: $accessInfo, searchInfo: $searchInfo}';
  }

  factory ItemsVO.fromJson(Map<String, dynamic> json) =>
      _$ItemsVOFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsVOToJson(this);
}
