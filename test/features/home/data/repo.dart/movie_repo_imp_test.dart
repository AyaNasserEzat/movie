import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:movies/core/errors/error_model.dart';
import 'package:movies/core/errors/failure.dart';
import 'package:movies/core/errors/exceptions.dart';
import 'package:movies/core/features/home/data/models/movie_detail_model/genre.dart';
import 'package:movies/core/features/home/data/models/movie_detail_model/movie_detail_model.dart';
import 'package:movies/core/features/home/data/models/movie_detail_model/production_company.dart';
import 'package:movies/core/features/home/data/models/movie_detail_model/production_country.dart';
import 'package:movies/core/features/home/data/models/movie_detail_model/spoken_language.dart';
import 'package:movies/core/features/home/data/models/movie_model.dart';
import 'package:movies/core/features/home/data/data_source/remote_data_source/movie_remote_data_source.dart';
import 'package:movies/core/features/home/data/repo/movie_repo_imp.dart';

@GenerateMocks([MovieRemoteDataSourceImp])
import 'movie_repo_imp_test.mocks.dart';

void main() {
  late MockMovieRemoteDataSourceImp remoteDataSource;
  late MovieRepoImp movieRepo;

  setUp(() {
    remoteDataSource = MockMovieRemoteDataSourceImp();
    movieRepo = MovieRepoImp(movieRemoteDataSource: remoteDataSource);
  });

  final movieModel = [
    MovieModel(
      id: 1,
      adult: false,
      backdropPath: "backdropPath",
      genreIds: [1, 2],
      originalLanguage: "en",
      originalTitle: "title",
      overview: "overview",
      popularity: 2.0,
      posterPath: "posterPath",
      releaseDate: "releaseDate",
      title: "title",
      video: false,
      voteAverage: 3.0,
      voteCount: 10,
    ),
  ];
group("now playing ", (){
  
  test(
    "returns Right(List<MovieEntity>) when remoteDataSource succeeds",
    () async {
      // رجع قائمة من MovieModel
      when(
        remoteDataSource.getNowPlaying(),
      ).thenAnswer((_) async => movieModel);

      final res = await movieRepo.getNowPlayingdMovie();

      expect(res, Right(movieModel));
      verify(remoteDataSource.getNowPlaying());
      verifyNoMoreInteractions(remoteDataSource);
    },
  );
  final failure = Failure(errorMessage: "Server Error");
  test(
    "returns Left(Failure) when remoteDataSource throws ServerException",
    () async {
      when(remoteDataSource.getNowPlaying()).thenThrow(
        ServerException(ErrorModel(status: 404, errorMessage: "Server Error")),
        //Exception('Server error')
      );

      final res = await movieRepo.getNowPlayingdMovie();

      expect(res, Left(failure));
      verify(remoteDataSource.getNowPlaying());
      verifyNoMoreInteractions(remoteDataSource);
    },
  );
});

///popular
group("popular movie ", (){

  test(
    "returns Right(List<MovieEntity>) when remoteDataSource succeeds",
    () async {
      // رجع قائمة من MovieModel
      when(
        remoteDataSource.getPopularMovie(),
      ).thenAnswer((_) async => movieModel);

      final res = await movieRepo.getPopularMovie();

      expect(res, Right(movieModel));
      verify(remoteDataSource.getPopularMovie());
      verifyNoMoreInteractions(remoteDataSource);
    },
  );
  final failure = Failure(errorMessage: "Server Error");
  test(
    "returns Left(Failure) when remoteDataSource throws ServerException",
    () async {
      when(remoteDataSource.getPopularMovie()).thenThrow(
        ServerException(ErrorModel(status: 404, errorMessage: "Server Error")),
        //Exception('Server error')
      );

      final res = await movieRepo.getPopularMovie();

      expect(res, Left(failure));
      verify(remoteDataSource.getPopularMovie());
      verifyNoMoreInteractions(remoteDataSource);
    },
  );
});

//top rated
group("top rated", (){
  test(
    "returns Right(List<MovieEntity>) when remoteDataSource succeeds",
    () async {
      // رجع قائمة من MovieModel
      when(
        remoteDataSource.getTopRated(),
      ).thenAnswer((_) async => movieModel);

      final res = await movieRepo.getTopRatedMovie();

      expect(res, Right(movieModel));
      verify(remoteDataSource.getTopRated());
      verifyNoMoreInteractions(remoteDataSource);
    },
  );
  final failure = Failure(errorMessage: "Server Error");
  test(
    "returns Left(Failure) when remoteDataSource throws ServerException",
    () async {
      when(remoteDataSource.getTopRated()).thenThrow(
        ServerException(ErrorModel(status: 404, errorMessage: "Server Error")),
        //Exception('Server error')
      );

      final res = await movieRepo.getTopRatedMovie();

      expect(res, Left(failure));
      verify(remoteDataSource.getTopRated());
      verifyNoMoreInteractions(remoteDataSource);
    },
  );
});
final int id=1;
group("similar movie", (){
  test(
    "returns Right(List<MovieEntity>) when remoteDataSource succeeds",
    () async {
      // رجع قائمة من MovieModel
      when(
        remoteDataSource.getSimilarMovies(id),
      ).thenAnswer((_) async => movieModel);

      final res = await movieRepo.getSimilarMovies(id);

      expect(res, Right(movieModel));
      verify(remoteDataSource.getSimilarMovies(id));
      verifyNoMoreInteractions(remoteDataSource);
    },
  );
  final failure = Failure(errorMessage: "Server Error");
  test(
    "returns Left(Failure) when remoteDataSource throws ServerException",
    () async {
      when(remoteDataSource.getSimilarMovies(1)).thenThrow(
        ServerException(ErrorModel(status: 404, errorMessage: "Server Error")),
        //Exception('Server error')
      );

      final res = await movieRepo.getSimilarMovies(id);

      expect(res, Left(failure));
      verify(remoteDataSource.getSimilarMovies(id));
      verifyNoMoreInteractions(remoteDataSource);
    },
  );
});
final tmovieModelDetails=MovieDetailModel(adult: true, backdropPath: "backdropPath", budget: 3, genres: [Genre(id: 1, name: "name")], id: id,  originCountry: ["originCountry"], originalLanguage: "originalLanguage", originalTitle: "originalTitle", overview: "overview", popularity: 2, posterPath: "posterPath", productionCompanies: [ProductionCompany(id: 2, name: "name", originCountry: "originCountry", logoPath: '')], productionCountries: [ProductionCountry(iso31661: "iso31661", name: "name")], releaseDate: "releaseDate", revenue: 3, runtime: 1, spokenLanguages: [SpokenLanguage(englishName: "englishName", iso6391: "iso6391", name: "name")], status: "status", tagline: "tagline", title: "title", video: false, voteAverage: 4, voteCount: 3, belongsToCollection: null, homepage: '', imdbId: '');
group("details movie", (){
  test(
    "returns Right(List<MovieEntity>) when remoteDataSource succeeds",
    () async {
      // رجع قائمة من MovieModel
      when(
        remoteDataSource.getMovieDetails(id),
      ).thenAnswer((_) async => tmovieModelDetails);

      final res = await movieRepo.getDetailsMovie(id);

      expect(res, Right(tmovieModelDetails));
      verify(remoteDataSource.getMovieDetails(id));
      verifyNoMoreInteractions(remoteDataSource);
    },
  );
  final failure = Failure(errorMessage: "Server Error");
  test(
    "returns Left(Failure) when remoteDataSource throws ServerException",
    () async {
      when(remoteDataSource.getMovieDetails(1)).thenThrow(
        ServerException(ErrorModel(status: 404, errorMessage: "Server Error")),
        //Exception('Server error')
      );

      final res = await movieRepo.getDetailsMovie(id);

      expect(res, Left(failure));
      verify(remoteDataSource.getMovieDetails(id));
      verifyNoMoreInteractions(remoteDataSource);
    },
  );
});
final String movie="our fault";
group("search movie", (){
  test(
    "returns Right(List<MovieEntity>) when remoteDataSource succeeds",
    () async {
      // رجع قائمة من MovieModel
      when(
        remoteDataSource.searchMovies(movie),
      ).thenAnswer((_) async => movieModel);

      final res = await movieRepo.searchMovies(movie);

      expect(res, Right(movieModel));
      verify(remoteDataSource.searchMovies(movie));
      verifyNoMoreInteractions(remoteDataSource);
    },
  );
  final failure = Failure(errorMessage: "Server Error");
  test(
    "returns Left(Failure) when remoteDataSource throws ServerException",
    () async {
      when(remoteDataSource.searchMovies(movie)).thenThrow(
        ServerException(ErrorModel(status: 404, errorMessage: "Server Error")),
        //Exception('Server error')
      );

      final res = await movieRepo.searchMovies(movie);

      expect(res, Left(failure));
      verify(remoteDataSource.searchMovies(movie));
      verifyNoMoreInteractions(remoteDataSource);
    },
  );
});
}
