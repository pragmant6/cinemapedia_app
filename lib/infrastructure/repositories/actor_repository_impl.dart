import 'package:cinemapedia_app/domain/data_sources/actors_data_source.dart';
import 'package:cinemapedia_app/domain/entities/actor.dart';
import 'package:cinemapedia_app/domain/repositories/actor_repository.dart';

class ActorRepositoryImpl extends ActorsRepository {
  final ActorsDataSource dataSource;
  ActorRepositoryImpl(this.dataSource);

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return dataSource.getActorsByMovie(movieId);
  }
}
