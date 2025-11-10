import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/features/home/domain/use_case/get_similar_movies.dart';
import 'package:movies/core/features/home/presentation/cubits/get_similar-movie/similar_movie_state.dart';

class SimilarMovieCubit extends Cubit<SimilarMovieState> {
  SimilarMovieCubit(this.getSimilarMoviesUseCase) : super(SimilarMoviesInitial());
  final GetSimilarMoviesUseCase getSimilarMoviesUseCase;
  getSimilarMovies(int id) async {
    emit(SimilarMoviesInitialLoading());
    final res =
        await getSimilarMoviesUseCase.call(id);
    res.fold(
      (failure) => emit(SimilarMoviesInitialFailure(failure.errorMessage)),
      (movie) => emit(SimilarMoviesInitialSuccess(movie)),
    );
  }
}
