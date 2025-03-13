import 'package:cinemapedia_app/config/constants/environment.dart';
import 'package:cinemapedia_app/infrastructure/models/movie_db/movie_details.dart';
import 'package:cinemapedia_app/infrastructure/models/movie_db/movie_movie_db.dart';
import 'package:cinemapedia_app/domain/entities/movie.dart';

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
            : 'https://th.bing.com/th/id/OIP.Lr_j_PgqTGzKxJTeIwajVwHaLH?rs=1&pid=ImgDetMain',
    releaseDate:
        movieDB.releaseDate != null ? movieDB.releaseDate! : DateTime.now(),
    title: movieDB.title,
    video: movieDB.video,
    voteAverage: movieDB.voteAverage,
    voteCount: movieDB.voteCount,
  );

  static Movie movieDetailsToEntity(MovieDetails movieDB) => Movie(
    adult: movieDB.adult,
    backdropPath:
        (movieDB.backdropPath.isNotEmpty)
            ? getUrlPath(movieDB.backdropPath)
            : getBackgroundPath(),
    genreIds: movieDB.genres.map((e) => e.name).toList(),
    id: movieDB.id,
    originalLanguage: movieDB.originalLanguage,
    originalTitle: movieDB.originalTitle,
    overview: movieDB.overview,
    popularity: movieDB.popularity,
    posterPath:
        (movieDB.backdropPath.isNotEmpty)
            ? getUrlPath(movieDB.backdropPath)
            : getBackgroundPath(),
    releaseDate: movieDB.releaseDate,
    title: movieDB.title,
    video: movieDB.video,
    voteAverage: movieDB.voteAverage,
    voteCount: movieDB.voteCount,
  );
}
