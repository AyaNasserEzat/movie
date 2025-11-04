import 'package:equatable/equatable.dart';
import 'package:movies/core/features/home/domain/entitiy/movie_entity.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchdMovieSuccess extends SearchState {
  final List<MovieEntity> movies;

  const SearchdMovieSuccess(this.movies);

  @override
  List<Object?> get props => [movies];
}

class SearchMovieFailure extends SearchState {
  final String message;

  const SearchMovieFailure(this.message);

  @override
  List<Object?> get props => [message];
}
