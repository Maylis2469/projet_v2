import 'package:json_annotation/json_annotation.dart';

part 'ComicVine_response.g.dart';

@JsonSerializable()
class CharactersResponse {
  @JsonKey(name: 'results')
  final List<CharactersResponseItem> results;

  CharactersResponse(this.results);

  factory CharactersResponse.fromJson(Map<String, dynamic> json) =>
      _$CharactersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersResponseToJson(this);
}

@JsonSerializable()
class CharactersResponseItem {
  @JsonKey(name: 'volume')
  final CharactersResponseImage tome;

  @JsonKey(name : 'issue_number')
  final String numtome;

  @JsonKey(name : 'cover_date')
  final String publication;

  CharactersResponseItem(this.tome,this.numtome,this.publication);

  factory CharactersResponseItem.fromJson(Map<String, dynamic> json) =>
      _$CharactersResponseItemFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersResponseItemToJson(this);
}

@JsonSerializable()
class CharactersResponseImage {
  @JsonKey(name: 'name')
  final String titre;

  CharactersResponseImage(this.titre);

  factory CharactersResponseImage.fromJson(Map<String, dynamic> json) =>
      _$CharactersResponseImageFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersResponseImageToJson(this);
}
