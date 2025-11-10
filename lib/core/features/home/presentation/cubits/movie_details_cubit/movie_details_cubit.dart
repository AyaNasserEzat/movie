import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/database/api/dio_concumer.dart';

import 'package:movies/core/features/home/data/data_source/remote_data_source/movie_remote_data_source.dart';
import 'package:movies/core/features/home/data/repo/movie_repo_imp.dart';
import 'package:movies/core/features/home/domain/use_case/movie_details_use_case.dart';

import 'package:movies/core/features/home/presentation/cubits/movie_details_cubit/movie_details_state.dart';


class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit(this.movieDetailsUseCase) : super(MovieDetailsInitial());
  final MovieDetailsUseCase movieDetailsUseCase;
  getMovieDetails(int id) async {
    emit(MovieDetailsLoading());
    final res =
        await movieDetailsUseCase.call(id);
    res.fold(
      (failure) => emit(MovieDetailsFailure(failure.errorMessage)),
      (movie) => emit(MovieDetailsLoadingSuccess(movie)),
    );
  }
}
