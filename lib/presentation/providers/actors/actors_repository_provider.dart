// Este repositorio es inmutable
import 'package:cinemapedia_app/infrastructure/data_sources/actor_movie_db_data_source.dart';
import 'package:cinemapedia_app/infrastructure/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(ActorMovieDbDataSource());
});
