import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/core/errors/failure.dart';
import 'package:movies/core/features/home/data/models/movie_model.dart';
import 'package:movies/core/features/home/domain/repo/movie_repo.dart';
import 'package:movies/core/features/home/domain/use_case/search_movie_use_case.dart';
@GenerateMocks([MovieRepo])
import "now_playing_use_case_test.mocks.dart";
void main() {
  late MovieRepo movieRepo;
  late SearchMovieUseCase searchMovieUseCase;
  setUp((){
    movieRepo=MockMovieRepo();
searchMovieUseCase  =SearchMovieUseCase(movieRepo:movieRepo );
  });
final String movie="our fault";
final tmovieModel=[MovieModel(backdropPath: "backdropPath", id: 1, overview: "overview", popularity: 2.0, posterPath: "posterPath", releaseDate: "releaseDate", title: "title", voteAverage: 3, adult: false, genreIds: [], originalLanguage: '', originalTitle: '', video: false, voteCount: 3)];
  test("test search movie use case right", ()async{
    when(movieRepo.searchMovies(movie)).thenAnswer((_)async=>Right(tmovieModel));
 final res=await searchMovieUseCase.call(movie);
 expect(res, Right(tmovieModel));
 verify(movieRepo.searchMovies(movie));
 verifyNoMoreInteractions(movieRepo);
  });
final failure=Failure(errorMessage: "errorMessage");
    test("test seaarch movie use case left", ()async{
    when(movieRepo.searchMovies(movie)).thenAnswer((_)async=>Left(failure));
 final res=await searchMovieUseCase.call(movie);
 expect(res, Left(failure));
 verify(movieRepo.searchMovies(movie));
 verifyNoMoreInteractions(movieRepo);
  });
}