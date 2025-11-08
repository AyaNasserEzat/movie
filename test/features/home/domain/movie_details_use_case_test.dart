import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/core/errors/failure.dart';
import 'package:movies/core/features/home/data/models/movie_detail_model/genre.dart';
import 'package:movies/core/features/home/data/models/movie_detail_model/movie_detail_model.dart';
import 'package:movies/core/features/home/data/models/movie_detail_model/production_company.dart';
import 'package:movies/core/features/home/data/models/movie_detail_model/production_country.dart';
import 'package:movies/core/features/home/data/models/movie_detail_model/spoken_language.dart';
import 'package:movies/core/features/home/domain/repo/movie_repo.dart';
import 'package:movies/core/features/home/domain/use_case/movie_details_use_case.dart';


import "now_playing_use_case_test.mocks.dart";
void main() {
  late MovieRepo movieRepo;
  late MovieDetailsUseCase movieDetailUseCase;
  setUp((){
    movieRepo=MockMovieRepo();
movieDetailUseCase  =MovieDetailsUseCase(movieRepo:movieRepo );
  });
final int movie=1;
final tmovieModelDetails=MovieDetailModel(adult: true, backdropPath: "backdropPath", budget: 3, genres: [Genre(id: 1, name: "name")], id: movie,  originCountry: ["originCountry"], originalLanguage: "originalLanguage", originalTitle: "originalTitle", overview: "overview", popularity: 2, posterPath: "posterPath", productionCompanies: [ProductionCompany(id: 2, name: "name", originCountry: "originCountry", logoPath: '')], productionCountries: [ProductionCountry(iso31661: "iso31661", name: "name")], releaseDate: "releaseDate", revenue: 3, runtime: 1, spokenLanguages: [SpokenLanguage(englishName: "englishName", iso6391: "iso6391", name: "name")], status: "status", tagline: "tagline", title: "title", video: false, voteAverage: 4, voteCount: 3, belongsToCollection: null, homepage: '', imdbId: '');
  test("test movie details  use case right", ()async{
    when(movieRepo.getDetailsMovie(movie)).thenAnswer((_)async=>Right(tmovieModelDetails));
 final res=await movieDetailUseCase.call(movie);
 expect(res, Right(tmovieModelDetails));
 verify(movieRepo.getDetailsMovie(movie));
 verifyNoMoreInteractions(movieRepo);
  });
final failure=Failure(errorMessage: "errorMessage");
    test("test movie details use case left", ()async{
    when(movieRepo.getDetailsMovie(movie)).thenAnswer((_)async=>Left(failure));
 final res=await movieDetailUseCase.call(movie);
 expect(res, Left(failure));
 verify(movieRepo.getDetailsMovie(movie));
 verifyNoMoreInteractions(movieRepo);
  });
}