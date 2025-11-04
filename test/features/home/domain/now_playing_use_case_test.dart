import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/core/errors/failure.dart';
import 'package:movies/core/features/home/domain/entitiy/movie_entity.dart';

import 'package:movies/core/features/home/domain/repo/movie_repo.dart';
import 'package:movies/core/features/home/domain/use_case/now_playing_use_case.dart';
@GenerateMocks([MovieRepo])
import "now_playing_use_case_test.mocks.dart";
void main() {
  late MovieRepo movieRepo;
  late NowPlayingUseCase nowPlayingUseCase;
  setUp((){
    movieRepo=MockMovieRepo();
nowPlayingUseCase  =NowPlayingUseCase(movieRepo:movieRepo );
  });

final movieEntity=[MovieEntity(backdropPath: "backdropPath", id: 1, overview: "overview", popularity: 2.0, posterPath: "posterPath", releaseDate: "releaseDate", title: "title", voteAverage: 3)];
  test("test now playing use case right", ()async{
    when(movieRepo.getNowPlayingdMovie()).thenAnswer((_)async=>Right(movieEntity));
 final res=await nowPlayingUseCase.call();
 expect(res, Right(movieEntity));
 verify(movieRepo.getNowPlayingdMovie());
 verifyNoMoreInteractions(movieRepo);
  });
final failure=Failure(errorMessage: "errorMessage");
    test("test now playing use case left", ()async{
    when(movieRepo.getNowPlayingdMovie()).thenAnswer((_)async=>Left(failure));
 final res=await nowPlayingUseCase.call();
 expect(res, Left(failure));
 verify(movieRepo.getNowPlayingdMovie());
 verifyNoMoreInteractions(movieRepo);
  });
}