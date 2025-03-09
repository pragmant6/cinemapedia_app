import 'package:cinemapedia_app/config/constants/environment.dart';
import 'package:cinemapedia_app/config/domain/entities/movie.dart';
import 'package:cinemapedia_app/config/infrastructure/models/movie_db/movie_movie_db.dart';

class MovieMapper {
  static String getUrlPath(String url) {
    return '${Environment.baseUrlTheMovieDbImage}/w500$url';
  }

  static String getBackgroundPath() {
    return 'https://png.pngtree.com/background/20220729/original/pngtree-glitch-style-poster-with-404-not-found-text-on-screen-with-picture-image_1867996.jpg';
  }

  static Movie movieDBToEntity(MovieMovieDB movieDB) => Movie(
    adult: movieDB.adult,
    backdropPath:
        (movieDB.backdropPath.isNotEmpty)
            ? getUrlPath(movieDB.backdropPath)
            : getBackgroundPath(),
    genreIds: movieDB.genreIds.map((e) => e.toString()).toList(),
    id: movieDB.id,
    originalLanguage: movieDB.originalLanguage,
    originalTitle: movieDB.originalTitle,
    overview: movieDB.overview,
    popularity: movieDB.popularity,
    posterPath:
        (movieDB.posterPath.isNotEmpty)
            ? getUrlPath(movieDB.posterPath)
            : 'no-poster',
    releaseDate: movieDB.releaseDate,
    title: movieDB.title,
    video: movieDB.video,
    voteAverage: movieDB.voteAverage,
    voteCount: movieDB.voteCount,
  );
}
