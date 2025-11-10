
import 'package:flutter_bloc/flutter_bloc.dart';

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
