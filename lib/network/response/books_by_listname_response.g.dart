// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books_by_listname_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookByListNameResponse _$BookByListNameResponseFromJson(
        Map<String, dynamic> json) =>
    BookByListNameResponse(
      json['status'] as String?,
      json['copyright'] as String?,
      json['num_results'] as int?,
      json['last_modified'] as String?,
      json['results'] == null
          ? null
          : ListNameResultVO.fromJson(json['results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookByListNameResponseToJson(
        BookByListNameResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'copyright': instance.copyright,
      'num_results': instance.numResults,
      'last_modified': instance.lastModified,
      'results': instance.results,
    };
