
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/core/errors/failure.dart';
import 'package:movies/core/features/home/domain/entitiy/movie_entity.dart';
import 'package:movies/core/features/home/domain/use_case/get_similar_movies.dart';
import 'package:movies/core/features/home/presentation/cubits/get_similar-movie/similar_movie_cubit.dart';
import 'package:movies/core/features/home/presentation/cubits/get_similar-movie/similar_movie_state.dart';

import 'get_similar_movie_cubit_test.mocks.dart';

@GenerateMocks([GetSimilarMoviesUseCase])
void main() {
    late MockGetSimilarMoviesUseCase mockSearchMovieUseCase;
  late SimilarMovieCubit similarMovieCubit;

  setUp((){
    mockSearchMovieUseCase=MockGetSimilarMoviesUseCase();
    similarMovieCubit=SimilarMovieCubit(mockSearchMovieUseCase);

  });
  final int movie=1;
      final tmovieEntity=[MovieEntity(backdropPath: "backdropPath", id: 1, overview: "overview", popularity: 2, posterPath: "posterPath", releaseDate: "releaseDate", title: "title", voteAverage: 2)];

  group("test similar cubit", (){
blocTest("emits [SimilarMoviesInitialLoading, SimilarMoviesSuccess] when data fetch success  ", 
build: (){
  when(mockSearchMovieUseCase.call(movie)).thenAnswer((_) async=>Right(tmovieEntity));
return similarMovieCubit;
},
act: (cubit) => cubit.getSimilarMovies(movie),
expect: () => [
 SimilarMoviesInitialLoading(),
  SimilarMoviesInitialSuccess(tmovieEntity),
 
],
);
     const tErrorMessage = 'Server Error';
      
blocTest("emits [SimilarMoviesInitialLoading, SimilarMoviesSuccess] when data fetch success  ", 
build: (){
  when(mockSearchMovieUseCase.call(movie)).thenAnswer((_) async=>Left(Failure(errorMessage: tErrorMessage)));
return similarMovieCubit;
},
act: (cubit) => cubit.getSimilarMovies(movie),
expect: () => [
 SimilarMoviesInitialLoading(),
  SimilarMoviesInitialFailure(tErrorMessage),
 
],
);

  });
}