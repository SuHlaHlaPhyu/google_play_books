// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overview_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OverviewResponse _$OverviewResponseFromJson(Map<String, dynamic> json) =>
    OverviewResponse(
      json['status'] as String?,
      json['copyright'] as String?,
      json['num_results'] as int?,
      json['last_modified'] as String?,
      json['results'] == null
          ? null
          : OverviewResultsVO.fromJson(json['results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OverviewResponseToJson(OverviewResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'copyright': instance.copyright,
      'num_results': instance.numResults,
      'last_modified': instance.lastModified,
      'results': instance.results,
    };
