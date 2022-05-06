// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overview_results_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OverviewResultsVO _$OverviewResultsVOFromJson(Map<String, dynamic> json) =>
    OverviewResultsVO(
      json['bestsellers_date'] as String?,
      json['published_date'] as String?,
      json['published_date_description'] as String?,
      json['previous_published_date'] as String?,
      json['next_published_date'] as String?,
      (json['lists'] as List<dynamic>?)
          ?.map((e) => ListVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['list_name'] as String?,
      json['list_name_encoded'] as String?,
      json['display_name'] as String?,
      json['updated'] as String?,
      json['normal_list_ends_at'] as int?,
      (json['books'] as List<dynamic>?)
          ?.map((e) => BooksVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OverviewResultsVOToJson(OverviewResultsVO instance) =>
    <String, dynamic>{
      'bestsellers_date': instance.bestsellersDate,
      'published_date': instance.publishedDate,
      'published_date_description': instance.publishedDateDescription,
      'previous_published_date': instance.previousPublishedDate,
      'next_published_date': instance.nextPublishedDate,
      'lists': instance.lists,
      'list_name': instance.listName,
      'list_name_encoded': instance.listNameEncoded,
      'display_name': instance.displayName,
      'updated': instance.updated,
      'normal_list_ends_at': instance.normalListEndsAt,
      'books': instance.books,
    };
