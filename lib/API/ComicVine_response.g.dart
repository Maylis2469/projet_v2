// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ComicVine_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharactersResponse _$CharactersResponseFromJson(Map<String, dynamic> json) =>
    CharactersResponse(
      (json['results'] as List<dynamic>)
          .map(
              (e) => CharactersResponseItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharactersResponseToJson(CharactersResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

CharactersResponseItem _$CharactersResponseItemFromJson(
        Map<String, dynamic> json) =>
    CharactersResponseItem(
      CharactersResponseImage.fromJson(json['volume'] as Map<String, dynamic>),
      json['issue_number'] as String,
      json['cover_date'] as String,
    );

Map<String, dynamic> _$CharactersResponseItemToJson(
        CharactersResponseItem instance) =>
    <String, dynamic>{
      'volume': instance.tome,
      'issue_number': instance.numtome,
      'cover_date': instance.publication,
    };

CharactersResponseImage _$CharactersResponseImageFromJson(
        Map<String, dynamic> json) =>
    CharactersResponseImage(
      json['name'] as String,
    );

Map<String, dynamic> _$CharactersResponseImageToJson(
        CharactersResponseImage instance) =>
    <String, dynamic>{
      'name': instance.titre,
    };
