import 'package:cinemapedia_app/config/constants/environment.dart';
import 'package:cinemapedia_app/infrastructure/mappers/actor_mapper.dart';
import 'package:cinemapedia_app/infrastructure/models/movie_db/credits_response.dart';
import 'package:cinemapedia_app/domain/data_sources/actors_data_source.dart';
import 'package:cinemapedia_app/domain/entities/actor.dart';
import 'package:dio/dio.dart';

class ActorMovieDbDataSource extends ActorsDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: Environment.baseUrlTheMovieDb,
      queryParameters: {
        'api_key': Environment.theMovieDBKey,
        'language': 'es-MX',
      },
    ),
  );

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');

    final castResponse = CreditsResponse.fromJson(response.data);

    List<Actor> actors =
        castResponse.cast
            .map((cast) => ActorMapper.castToEntity(cast))
            .toList();

    return actors;
  }
}
