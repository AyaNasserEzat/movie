import 'package:movies/core/features/home/data/models/movie_detail_model/genre.dart';

class MovieDetailsEntity {
  final String? backdropPath;

  final List<Genre> genres;

  final int id;

  final String overview;
  final double popularity;
  final String? posterPath;

  final String releaseDate;

  final int runtime;

  final String title;

  final double voteAverage;

  MovieDetailsEntity({
    required this.backdropPath,
    required this.genres,
    required this.id,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.runtime,
    required this.title,
    required this.voteAverage,
  });
}
