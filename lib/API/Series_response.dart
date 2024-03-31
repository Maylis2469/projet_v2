import 'package:json_annotation/json_annotation.dart';

part "Series_response.g.dart";

@JsonSerializable()
class SeriesResponse {
  @JsonKey(name: 'results')
  final List<SeriesResponseItem > results;

  SeriesResponse(this.results);

  factory SeriesResponse.fromJson(Map<String, dynamic> json) =>
      _$SeriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SeriesResponseToJson(this);
}

@JsonSerializable()
class SeriesResponseItem {


  @JsonKey(name : 'name')
  final String titre;

  /*@JsonKey(name : 'count_of_episodes')
  final String nbreprisodes;*/

  @JsonKey(name : 'start_year')
  final String debut;

   //@JsonKey(name: 'publisher')
  //final SeriesResponseLien maison;

  SeriesResponseItem (this.titre,this.debut);

  factory SeriesResponseItem .fromJson(Map<String, dynamic> json) =>
      _$SeriesResponseItemFromJson(json);

  Map<String, dynamic> toJson() => _$SeriesResponseItemToJson(this);
}

/*@JsonSerializable()
class SeriesResponseLien {
  @JsonKey(name: 'name')
  final String edition;


  SeriesResponseLien (this.edition);

  factory SeriesResponseLien .fromJson(Map<String, dynamic> json) =>
      _$SeriesResponseLienFromJson(json);

  Map<String, dynamic> toJson() => _$SeriesResponseLienToJson(this);
}*/