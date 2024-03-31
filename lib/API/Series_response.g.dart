// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Series_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeriesResponse _$SeriesResponseFromJson(Map<String, dynamic> json) =>
    SeriesResponse(
      (json['results'] as List<dynamic>)
          .map((e) => SeriesResponseItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SeriesResponseToJson(SeriesResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

SeriesResponseItem _$SeriesResponseItemFromJson(Map<String, dynamic> json) =>
    SeriesResponseItem(
      json['name'] as String,
      json['start_year'] as String,
    );

Map<String, dynamic> _$SeriesResponseItemToJson(SeriesResponseItem instance) =>
    <String, dynamic>{
      'name': instance.titre,
      'start_year': instance.debut,
    };
