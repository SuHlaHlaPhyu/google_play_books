import 'package:google_play_books/data/vos/panelization_summary_vo.dart';
import 'package:google_play_books/data/vos/reading_modes_vo.dart';
import 'package:json_annotation/json_annotation.dart';

import 'image_links_vo.dart';
import 'industry_identifiers_vo.dart';

part 'volume_info_vo.g.dart';

@JsonSerializable()
class VolumeInfoVO {

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "authors")
  List<String>? authors;

  @JsonKey(name: "publisher")
  String? publisher;

  @JsonKey(name: "publishedDate")
  String? publishedDate;

  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "industryIdentifiers")
  List<industryIdentifiersVO>? industryIdentifiers;

  @JsonKey(name: "readingModes")
  ReadingModesVO? readingModes;

  @JsonKey(name: "pageCount")
  int? pageCount;

  @JsonKey(name: "printType")
  String? printType;

  @JsonKey(name: "categories")
  List<String>? categories;

  @JsonKey(name: "maturityRating")
  String? maturityRating;

  @JsonKey(name: "allowAnonLogging")
  bool? allowAnonLogging;

  @JsonKey(name: "contentVersion")
  String? contentVersion;

  @JsonKey(name: "panelizationSummary")
  PanelizationSummaryVO? panelizationSummary;

  @JsonKey(name: "imageLinks")
  ImageLinksVO? imageLinks;

  @JsonKey(name: "language")
  String? language;

  @JsonKey(name: "previewLink")
  String? previewLink;

  @JsonKey(name: "infoLink")
  String? infoLink;

  @JsonKey(name: "canonicalVolumeLink")
  String? canonicalVolumeLink;


  VolumeInfoVO(
      this.title,
      this.authors,
      this.publisher,
      this.publishedDate,
      this.description,
      this.industryIdentifiers,
      this.readingModes,
      this.pageCount,
      this.printType,
      this.categories,
      this.maturityRating,
      this.allowAnonLogging,
      this.contentVersion,
      this.panelizationSummary,
      this.imageLinks,
      this.language,
      this.previewLink,
      this.infoLink,
      this.canonicalVolumeLink);


  @override
  String toString() {
    return 'VolumeInfoVO{title: $title, authors: $authors, publisher: $publisher, publishedDate: $publishedDate, description: $description, industryIdentifiers: $industryIdentifiers, readingModes: $readingModes, pageCount: $pageCount, printType: $printType, categories: $categories, maturityRating: $maturityRating, allowAnonLogging: $allowAnonLogging, contentVersion: $contentVersion, panelizationSummary: $panelizationSummary, imageLinks: $imageLinks, language: $language, previewLink: $previewLink, infoLink: $infoLink, canonicalVolumeLink: $canonicalVolumeLink}';
  }

  factory VolumeInfoVO.fromJson(Map<String, dynamic> json) =>
      _$VolumeInfoVOFromJson(json);

  Map<String, dynamic> toJson() => _$VolumeInfoVOToJson(this);
}
