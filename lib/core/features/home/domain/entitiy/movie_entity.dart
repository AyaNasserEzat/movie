import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable{
  final String backdropPath;
  // final List<int> genreIds;
  final int id;
  // final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final double voteAverage;
  // final int voteCount;

  const MovieEntity({
    required this.backdropPath,
    // required this.genreIds,
    required this.id,
    //required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    // required this.voteCount,
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => [backdropPath,
    id,
    overview,
    popularity,
    posterPath,
    releaseDate,
    title,
    voteAverage,];
}
