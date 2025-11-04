import 'package:equatable/equatable.dart';
import 'package:movies/core/features/home/data/models/movie_detail_model/movie_detail_model.dart';
import 'package:movies/core/features/home/domain/entitiy/movie_entity.dart';

abstract class MovieDetailsState extends Equatable {
  const MovieDetailsState();

  @override
  List<Object?> get props => [];
}

class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsLoading extends MovieDetailsState {}

class MovieDetailsLoadingSuccess extends MovieDetailsState {
  final MovieDetailModel movies;

  const MovieDetailsLoadingSuccess(this.movies);

  @override
  List<Object?> get props => [movies];
}

class MovieDetailsFailure extends MovieDetailsState {
  final String message;

  const MovieDetailsFailure(this.message);

  @override
  List<Object?> get props => [message];
}
