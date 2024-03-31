import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'Movies_response.dart';

part 'appel_API_movies.g.dart';



@RestApi()
abstract class ComicVineAPI {
  factory ComicVineAPI(Dio dio, {required String baseUrl}) = _ComicVineAPI;

// Génèrera {url}/pokemon/ditto?param=123
  @GET('movies')
  Future<MoviesResponse> getCharacters(@Query('limit') int limit);
}

class MNetworkRequest {
  final ComicVineAPI _api = ComicVineAPI(
      Dio(
        BaseOptions(
          queryParameters: {
            'api_key': '681f19942b07b42cbe3b8a69204db41fa6deec7e',
            'format': 'json',
          },
        ),
      ),
      baseUrl: 'https://api.formation-android.fr/comicvine?url=');

  Future<MoviesResponse> loadMovies() {
    try {
      print('aa');
      return _api.getCharacters(20);
    } catch (e) {
      print (e);
      rethrow;
    }
  }
}