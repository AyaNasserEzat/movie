import 'package:equatable/equatable.dart';

import 'package:movies/core/features/home/data/models/movie_model.dart';
import 'package:movies/core/features/home/domain/entitiy/movie_entity.dart';


abstract class SimilarMovieState extends Equatable {
  const SimilarMovieState();

  @override
  List<Object?> get props => [];
}

class SimilarMoviesInitial extends SimilarMovieState {}

class SimilarMoviesInitialLoading extends SimilarMovieState {}

class SimilarMoviesInitialSuccess extends SimilarMovieState {
  final List<MovieEntity> movies;

  const SimilarMoviesInitialSuccess(this.movies);

  @override
  List<Object?> get props => [movies];
}

class SimilarMoviesInitialFailure extends SimilarMovieState {
  final String message;

  const SimilarMoviesInitialFailure(this.message);

  @override
  List<Object?> get props => [message];
}
