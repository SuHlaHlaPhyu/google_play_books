import 'package:google_play_books/persistance/hive_constant.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';

import 'books_vo.dart';

part 'list_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_OVERVIEW_LIST_VO, adapterName: "OverviewLinkVOAdapter")
class ListVO {
  @JsonKey(name: "list_id")
  @HiveField(0)
  int? listId;

  @JsonKey(name: "list_name")
  @HiveField(1)
  String? listName;

  @JsonKey(name: "list_name_encoded")
  @HiveField(2)
  String? listNameEncoded;

  @JsonKey(name: "display_name")
  @HiveField(3)
  String? displayName;

  @JsonKey(name: "updated")
  @HiveField(4)
  String? updated;

  @JsonKey(name: "list_image")
  @HiveField(5)
  String? listImage;

  @JsonKey(name: "list_image_width")
  @HiveField(6)
  int? listImageWidth;

  @JsonKey(name: "list_image_height")
  @HiveField(7)
  int? listImageHeight;

  @JsonKey(name: "books")
  @HiveField(8)
  List<BooksVO>? books;

  ListVO(
      this.listId,
      this.listName,
      this.listNameEncoded,
      this.displayName,
      this.updated,
      this.listImage,
      this.listImageWidth,
      this.listImageHeight,
      this.books);


  @override
  String toString() {
    return 'ListVO{listId: $listId, listName: $listName, listNameEncoded: $listNameEncoded, displayName: $displayName, updated: $updated, listImage: $listImage, listImageWidth: $listImageWidth, listImageHeight: $listImageHeight, books: $books}';
  }

  factory ListVO.fromJson(Map<String, dynamic> json) =>
      _$ListVOFromJson(json);

      

  Map<String, dynamic> toJson() => _$ListVOToJson(this);
}
