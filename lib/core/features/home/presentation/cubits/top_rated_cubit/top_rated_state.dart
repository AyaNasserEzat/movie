import 'package:equatable/equatable.dart';
import 'package:movies/core/features/home/domain/entitiy/movie_entity.dart';

abstract class TopRatedMovieState extends Equatable {
  const TopRatedMovieState();

  @override
  List<Object?> get props => [];
}

class TopRatedMovieInitial extends TopRatedMovieState {}

class TopRatedMovieLoading extends TopRatedMovieState {}

class TopRatedMovieSuccess extends TopRatedMovieState {
  final List<MovieEntity> movies;

  const TopRatedMovieSuccess(this.movies);

  @override
  List<Object?> get props => [movies];
}

class TopRatedMovieFailure extends TopRatedMovieState {
  final String message;

  const TopRatedMovieFailure(this.message);

  @override
  List<Object?> get props => [message];
}
