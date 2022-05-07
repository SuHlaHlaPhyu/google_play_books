import 'package:google_play_books/persistance/hive_constant.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';

part 'reviews_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_REVIEW_VO, adapterName: "ReviewVOAdapter")
class ReviewsVO {
  @JsonKey(name: "book_review_link")
  @HiveField(0)
  String? bookReviewLink;

  @JsonKey(name: "first_chapter_link")
  @HiveField(1)
  String? firstChapterLink;

  @JsonKey(name: "sunday_review_link")
  @HiveField(2)
  String? sundayReviewLink;

  @JsonKey(name: "article_chapter_link")
  @HiveField(4)
  String? articleChapterLink;


  ReviewsVO(this.bookReviewLink, this.firstChapterLink, this.sundayReviewLink,
      this.articleChapterLink);


  @override
  String toString() {
    return 'ReviewsVO{bookReviewLink: $bookReviewLink, firstChapterLink: $firstChapterLink, sundayReviewLink: $sundayReviewLink, articleChapterLink: $articleChapterLink}';
  }

  factory ReviewsVO.fromJson(Map<String, dynamic> json) =>
      _$ReviewsVOFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewsVOToJson(this);
}
