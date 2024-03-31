import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'ComicVine_response.dart';

part 'appel_API.g.dart';



@RestApi()
abstract class ComicVineAPI {
  factory ComicVineAPI(Dio dio, {required String baseUrl}) = _ComicVineAPI;

// Génèrera {url}/pokemon/ditto?param=123
  @GET('issues')
  Future<CharactersResponse> getCharacters(@Query('limit') int limit);
}

class NetworkRequest {
  final ComicVineAPI _api = ComicVineAPI(
      Dio(
        BaseOptions(
          queryParameters: {
            'api_key': 'f8641c79aa779adc0cd3c797d273abd0ad0d64b1',
            'format': 'json',
          },
        ),
      ),
      baseUrl: 'https://api.formation-android.fr/comicvine?url=');

  Future<CharactersResponse> loadCharacters() {
    try {
      print('aa');
      return _api.getCharacters(20);
    } catch (e) {
      print (e);
      rethrow;
    }
  }
}