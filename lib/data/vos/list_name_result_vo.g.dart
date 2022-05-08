// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_name_result_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListNameResultVO _$ListNameResultVOFromJson(Map<String, dynamic> json) =>
    ListNameResultVO(
      json['list_name'] as String?,
      json['list_name_encoded'] as String?,
      json['bestsellers_date'] as String?,
      json['published_date'] as String?,
      json['published_date_description'] as String?,
      json['next_published_date'] as String?,
      json['previous_published_date'] as String?,
      json['display_name'] as String?,
      json['normal_list_ends_at'] as int?,
      json['updated'] as String?,
      (json['books'] as List<dynamic>?)
          ?.map((e) => BooksVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListNameResultVOToJson(ListNameResultVO instance) =>
    <String, dynamic>{
      'list_name': instance.listName,
      'list_name_encoded': instance.listNameEncoded,
      'bestsellers_date': instance.bestsellersDate,
      'published_date': instance.publishedDate,
      'published_date_description': instance.publishedDateDescription,
      'next_published_date': instance.nextPublishedDate,
      'previous_published_date': instance.previousPublishedDate,
      'display_name': instance.displayName,
      'normal_list_ends_at': instance.normalListEndsAt,
      'updated': instance.updated,
      'books': instance.books,
    };
