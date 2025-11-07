import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/database/api/dio_concumer.dart';

import 'package:movies/core/features/home/data/data_source/remote_data_source/movie_remote_data_source.dart';
import 'package:movies/core/features/home/data/repo/movie_repo_imp.dart';
import 'package:movies/core/features/home/domain/use_case/popular_movie_usecase.dart';
import 'package:movies/core/features/home/presentation/cubits/popular_movie_cubit/popular_movie_state.dart';

class PopularMovieCubit extends Cubit<PopularMovieState> {
  PopularMovieCubit(this.popularMovieUsecase) : super(PopularMovieInitial());
  final PopularMovieUsecase popularMovieUsecase;
  getPopularMovie() async {
    emit(PopularMovieLoading());
    final res =
        await popularMovieUsecase.call();
    res.fold(
      (failure) => emit(PopularMovieFailure(failure.errorMessage)),
      (movie) => emit(PopularMovieSuccess(movie)),
    );
  }
}
