import 'package:json_annotation/json_annotation.dart';

part "Movies_response.g.dart";

@JsonSerializable()
class MoviesResponse {
  @JsonKey(name: 'results')
  final List<MoviesResponseItem > results;

  MoviesResponse(this.results);

  factory MoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$MoviesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesResponseToJson(this);
}

@JsonSerializable()
class MoviesResponseItem {
 @JsonKey(name: 'release_date')
  final String date;

  @JsonKey(name : 'name')
  final String titre;

  @JsonKey(name : 'runtime')
  final String temps;

  MoviesResponseItem (this.titre,this.date,this.temps);

  factory MoviesResponseItem .fromJson(Map<String, dynamic> json) =>
      _$MoviesResponseItemFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesResponseItemToJson(this);
}