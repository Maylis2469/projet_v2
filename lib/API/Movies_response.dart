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

 @JsonKey(name: 'image')
 final MoviesResponseurl affiche;

  MoviesResponseItem (this.titre,this.date,this.temps,this.affiche);

  factory MoviesResponseItem .fromJson(Map<String, dynamic> json) =>
      _$MoviesResponseItemFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesResponseItemToJson(this);
}

@JsonSerializable()
class MoviesResponseurl {
  @JsonKey(name: 'small_url')
  final String url;


  MoviesResponseurl(this.url);

  factory MoviesResponseurl.fromJson(Map<String, dynamic> json) =>
      _$MoviesResponseurlFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesResponseurlToJson(this);
}