// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListResponse _$ListResponseFromJson(Map<String, dynamic> json) => ListResponse(
      json['status'] as String?,
      json['copyright'] as String?,
      json['num_results'] as int?,
      json['last_modified'] as String?,
      (json['results'] as List<dynamic>?)
          ?.map((e) => ListResultVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListResponseToJson(ListResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'copyright': instance.copyright,
      'num_results': instance.numResults,
      'last_modified': instance.lastModified,
      'results': instance.results,
    };
