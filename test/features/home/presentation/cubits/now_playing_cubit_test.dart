
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/core/errors/failure.dart';
import 'package:movies/core/features/home/domain/entitiy/movie_entity.dart';
import 'package:movies/core/features/home/domain/use_case/now_playing_use_case.dart';
import 'package:movies/core/features/home/presentation/cubits/now_playing_cubit/now_Playing_movie_cubit.dart';
import 'package:movies/core/features/home/presentation/cubits/now_playing_cubit/now_playing_move_state.dart';
// The UseCase abstract class should be mocked
@GenerateMocks([NowPlayingUseCase])
import 'now_playing_cubit_test.mocks.dart';
void main() {
  late MockNowPlayingUseCase mockNowPlayingUseCase;
  late NowPlayingMovieCubit nowPlayingMovieCubit;
  setUp((){
mockNowPlayingUseCase=MockNowPlayingUseCase();
// Inject the mock into the Cubit
nowPlayingMovieCubit=NowPlayingMovieCubit(mockNowPlayingUseCase);
  });
tearDown(() {
    // إغلاق الـ Cubit
    nowPlayingMovieCubit.close(); 
  });
  blocTest<NowPlayingMovieCubit, NowPlayingMovieState>("description",
   build: (){
final tmovieEntity=[MovieEntity(backdropPath: "backdropPath", id: 1, overview: "overview", popularity: 2, posterPath: "posterPath", releaseDate: "releaseDate", title: "title", voteAverage: 2)];
when(mockNowPlayingUseCase.call()).thenAnswer((_) async=>Right(tmovieEntity) );
return nowPlayingMovieCubit;
  },
  //act
  act: (cubit) => cubit.getNowPlayingMovie() ,
  //assert
  expect: ()=>[
    isA<NowPlayingMovieLoading>(),
    isA<NowPlayingMovieSuccess>().having((state)=>state.movies, "list movie", equals([MovieEntity(backdropPath: "backdropPath", id: 1, overview: "overview", popularity: 2, posterPath: "posterPath", releaseDate: "releaseDate", title: "title", voteAverage: 2)],))
  ],
  verify: (_) {
      // Verify that the UseCase was called exactly once
      verify(mockNowPlayingUseCase.call()).called(1);
    },
  );

  // Test case for a failure during data retrieval
  blocTest<NowPlayingMovieCubit, NowPlayingMovieState>(
    'emits [NowPlayingMovieLoading, NowPlayingMovieFailure] when data fetch fails',
    build: () {
      const tErrorMessage = 'Server Error';
      
      // Stub the mock to return a failure result (Left)
      when(mockNowPlayingUseCase.call())
          .thenAnswer((_) async => Left(Failure( errorMessage: tErrorMessage)));
      return nowPlayingMovieCubit;
    },
    act: (cubit) => cubit.getNowPlayingMovie(),
    // Expect the state sequence: Initial -> Loading -> Failure
    expect: () => [
      isA<NowPlayingMovieLoading>(),
      isA<NowPlayingMovieFailure>().having(
        (state) => state.message,
        'errorMessage',
        equals('Server Error'),
      ),
    ],
    verify: (_) {
      // Verify that the UseCase was called exactly once
      verify(mockNowPlayingUseCase.call()).called(1);
    },
  );
}


