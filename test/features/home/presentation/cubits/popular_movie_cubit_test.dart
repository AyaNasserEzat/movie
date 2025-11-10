
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/core/errors/failure.dart';
import 'package:movies/core/features/home/domain/entitiy/movie_entity.dart';
import 'package:movies/core/features/home/domain/use_case/popular_movie_usecase.dart';
import 'package:movies/core/features/home/presentation/cubits/popular_movie_cubit/popular_movie_cubit.dart';
import 'package:movies/core/features/home/presentation/cubits/popular_movie_cubit/popular_movie_state.dart';

import 'popular_movie_cubit_test.mocks.dart';
@GenerateMocks([PopularMovieUsecase])

void main() {
  late MockPopularMovieUsecase mockPopularMovieUseCase;
  late PopularMovieCubit popularMovieCubit;
  setUp((){
mockPopularMovieUseCase=MockPopularMovieUsecase();
// Inject the mock into the Cubit
popularMovieCubit=PopularMovieCubit(mockPopularMovieUseCase);
  });
tearDown(() {
    // إغلاق الـ Cubit
    popularMovieCubit.close(); 
  });group("popular movie cubit", (){
    final tmovieEntity=[MovieEntity(backdropPath: "backdropPath", id: 1, overview: "overview", popularity: 2, posterPath: "posterPath", releaseDate: "releaseDate", title: "title", voteAverage: 2)];

  blocTest<PopularMovieCubit, PopularMovieState>("emits [PopularMovieLoading, PopularMovieSuccess] when data fetch fails",
   build: (){
when(mockPopularMovieUseCase.call()).thenAnswer((_) async=>Right(tmovieEntity) );
return popularMovieCubit;
  },
  //act
  act: (cubit) => cubit.getPopularMovie() ,
  //assert
  expect: ()=>[
    isA<PopularMovieLoading>(),
    isA<PopularMovieSuccess>().having((state)=>state.movies, "list movie",
     equals(tmovieEntity))
  ],
  verify: (_) {
      // Verify that the UseCase was called exactly once
      verify(mockPopularMovieUseCase.call()).called(1);
    },
  );

  // Test case for a failure during data retrieval
  blocTest<PopularMovieCubit, PopularMovieState>(
    'emits [PopularMovieLoading, PopularMovieFailure] when data fetch fails',
    build: () {
      const tErrorMessage = 'Server Error';
      
      // Stub the mock to return a failure result (Left)
      when(mockPopularMovieUseCase.call())
          .thenAnswer((_) async => Left(Failure( errorMessage: tErrorMessage)));
      return popularMovieCubit;
    },
    act: (cubit) => cubit.getPopularMovie(),
    // Expect the state sequence: Initial -> Loading -> Failure
    expect: () => [
      isA<PopularMovieLoading>(),
      isA<PopularMovieFailure>().having(
        (state) => state.message,
        'errorMessage',
        equals('Server Error'),
      ),
    ],
    verify: (_) {
      // Verify that the UseCase was called exactly once
      verify(mockPopularMovieUseCase.call()).called(1);
    },
  );
  });
}


