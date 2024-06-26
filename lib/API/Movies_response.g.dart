// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Movies_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesResponse _$MoviesResponseFromJson(Map<String, dynamic> json) =>
    MoviesResponse(
      (json['results'] as List<dynamic>)
          .map((e) => MoviesResponseItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MoviesResponseToJson(MoviesResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

MoviesResponseItem _$MoviesResponseItemFromJson(Map<String, dynamic> json) =>
    MoviesResponseItem(
      json['name'] as String,
      json['release_date'] as String,
      json['runtime'] as String,
      MoviesResponseurl.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MoviesResponseItemToJson(MoviesResponseItem instance) =>
    <String, dynamic>{
      'release_date': instance.date,
      'name': instance.titre,
      'runtime': instance.temps,
      'image': instance.affiche,
    };

MoviesResponseurl _$MoviesResponseurlFromJson(Map<String, dynamic> json) =>
    MoviesResponseurl(
      json['small_url'] as String,
    );

Map<String, dynamic> _$MoviesResponseurlToJson(MoviesResponseurl instance) =>
    <String, dynamic>{
      'small_url': instance.url,
    };
