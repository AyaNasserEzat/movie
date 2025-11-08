import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/core/database/api/api_consumer.dart';
import 'package:movies/core/database/api/end_point.dart';
import 'package:movies/core/features/home/data/data_source/remote_data_source/movie_remote_data_source.dart';
import 'package:movies/core/features/home/data/models/movie_detail_model/movie_detail_model.dart';
import 'package:movies/core/features/home/data/models/movie_model.dart';

// علشان نقدر نعمل mock لـ ApiConsumer
@GenerateMocks([ApiConsumer])
import 'movie_remote_data_source_test.mocks.dart';

void main() {
  late MockApiConsumer mockApi;
  late MovieRemoteDataSourceImp remoteDataSource;

  setUp(() {
    mockApi = MockApiConsumer();
    remoteDataSource = MovieRemoteDataSourceImp(api: mockApi);
  });

  const tUrl = "${EndPoint.getNowPlayingMovieEndpoint}?api_key=${EndPoint.apiKey}";
const tPopularUrl= "${EndPoint.getPopularMovieEndpoint}?api_key=${EndPoint.apiKey}";
const tTopRatedUrl= "${EndPoint.getTopRatedMovieEndpoint}?api_key=${EndPoint.apiKey}";
const int id=1;
const tMovieDetailsUrl="${EndPoint.getMovieDetailsEndpoint}/$id?api_key=${EndPoint.apiKey}";
const tSimilarUrl="${EndPoint.getMovieDetailsEndpoint}$id/recommendations?api_key=${EndPoint.apiKey}";
  final tMovieJson = {
    "id": 1,
    "adult": false,
    "backdrop_path": "/path.jpg",
    "genre_ids": [12, 18],
    "original_language": "en",
    "original_title": "Inception",
    "overview": "Dream movie",
    "popularity": 9.0,
    "poster_path": "/poster.jpg",
    "release_date": "2010-07-16",
    "title": "Inception",
    "video": false,
    "vote_average": 8.8,
    "vote_count": 12000
  };

  final tResponse = {
    "results": [tMovieJson]
  };

final tmovieModelDetails={
  "adult": true, "backdropPath": "backdropPath", "budget": 3, "genres": [{"id": 1, "name": "name"}], "id": id,  "originCountry": ["originCountry"], "originalLanguage": "originalLanguage", "originalTitle": "originalTitle", "overview": "overview", "popularity": 2, "posterPath": "posterPath", "productionCompanies": [{id: 2, "name": "name", "originCountry": "originCountry", "logoPath": ''}], "productionCountries": [{"iso31661": "iso31661", "name": "name"}], "releaseDate": "releaseDate", "revenue": 3, "runtime": 1, "spokenLanguages": [{"englishName": "englishName", "iso6391": "iso6391", "name": "name"}], "status": "status", "tagline": "tagline", "title": "title", "video": false, "voteAverage": 4, "voteCount": 3, "belongsToCollection": null, "homepage": '', "imdbId": ''};

group("get new playing api", (){
  test('should return List<MovieModel> when api call is successful', () async {
    // arrange
    when(mockApi.get(tUrl)).thenAnswer((_) async => tResponse);

    // act
    final result = await remoteDataSource.getNowPlaying();

    // assert
    expect(result, isA<List<MovieModel>>());
    expect(result.first.id, 1);
    expect(result.first.title, "Inception");
    expect(result.first.voteAverage, 8.8);

    // بنأكد إن الدالة فعلاً نادت الـ API صح
    verify(mockApi.get(tUrl));
    verifyNoMoreInteractions(mockApi);
  });

  test('should throw Exception when API fails', () async {
    // arrange
    when(mockApi.get(tUrl)).thenThrow(Exception('Server error'));

    // act + assert
    expect(() => remoteDataSource.getNowPlaying(), throwsA(isA<Exception>()));
  });
});
//popular move
group("get popular movie  api", (){
  test('should return List<MovieModel> when api call is successful', () async {
    // arrange
    when(mockApi.get(tPopularUrl)).thenAnswer((_) async => tResponse);

    // act
    final result = await remoteDataSource.getPopularMovie();

    // assert
    expect(result, isA<List<MovieModel>>());
    expect(result.first.id, 1);
    expect(result.first.title, "Inception");
    expect(result.first.voteAverage, 8.8);

    // بنأكد إن الدالة فعلاً نادت الـ API صح
    verify(mockApi.get(tPopularUrl));
    verifyNoMoreInteractions(mockApi);
  });

  test('should throw Exception when API fails', () async {
    // arrange
    when(mockApi.get(tPopularUrl)).thenThrow(Exception('Server error'));

    // act + assert
    expect(() => remoteDataSource.getPopularMovie(), throwsA(isA<Exception>()));
  });
});
//top rated
group("get top Rated movie  api", (){
  test('should return List<MovieModel> when api call is successful', () async {
    // arrange
    when(mockApi.get(tTopRatedUrl)).thenAnswer((_) async => tResponse);

    // act
    final result = await remoteDataSource.getTopRated();

    // assert
    expect(result, isA<List<MovieModel>>());
    // بنأكد إن الدالة فعلاً نادت الـ API صح
    verify(mockApi.get(tTopRatedUrl));
    verifyNoMoreInteractions(mockApi);
  });

  test('should throw Exception when API fails', () async {
    // arrange
    when(mockApi.get(tTopRatedUrl)).thenThrow(Exception('Server error'));
    // act + assert
    expect(() => remoteDataSource.getTopRated(), throwsA(isA<Exception>()));
  });
});
//movie datails
group("get details movie  api", (){
  test('should return movDetailsModel when api call is successful', () async {
    // arrange
    when(mockApi.get(tMovieDetailsUrl)).thenAnswer((_) async =>tmovieModelDetails);

    // act
    final result = await remoteDataSource.getMovieDetails(id);

    // assert
    expect(result, isA<MovieDetailModel>());
    // بنأكد إن الدالة فعلاً نادت الـ API صح
    verify(mockApi.get(tMovieDetailsUrl));
    verifyNoMoreInteractions(mockApi);
  });

  test('should throw Exception when API fails', () async {
    // arrange
    when(mockApi.get(tMovieDetailsUrl)).thenThrow(Exception('Server error'));
    // act + assert
    expect(() => remoteDataSource.getMovieDetails(id), throwsA(isA<Exception>()));
  });
});
//movi similer
group("get similar movie  api", (){
  test('should return list<moveiModel> when api call is successful', () async {
    // arrange
    when(mockApi.get(tSimilarUrl)).thenAnswer((_) async =>tResponse);

    // act
    final result = await remoteDataSource.getSimilarMovies(id);

    // assert
    expect(result, isA<List<MovieModel>>());
    // بنأكد إن الدالة فعلاً نادت الـ API صح
    verify(mockApi.get(tSimilarUrl));
    verifyNoMoreInteractions(mockApi);
  });

  test('should throw Exception when API fails', () async {
    // arrange
    when(mockApi.get(tSimilarUrl)).thenThrow(Exception('Server error'));
    // act + assert
    expect(() => remoteDataSource.getSimilarMovies(id), throwsA(isA<Exception>()));
  });
});
//search
const tSearchUrl="${EndPoint.searchEndpoint}?api_key=${EndPoint.apiKey}";
final String searchedMovie="our fault";
group("get search movie  api", (){
  test('should return list<moveiModel> when api call is successful', () async {
    // arrange
    when(mockApi.get(tSearchUrl,querParameters:{"query":searchedMovie} )).thenAnswer((_) async =>tResponse);

    // act
    final result = await remoteDataSource.searchMovies(searchedMovie);

    // assert
    expect(result, isA<List<MovieModel>>());
    // بنأكد إن الدالة فعلاً نادت الـ API صح
    verify(mockApi.get(tSearchUrl,querParameters:{"query":searchedMovie}));
    verifyNoMoreInteractions(mockApi);
  });

  test('should throw Exception when API fails', () async {
    // arrange
    when(mockApi.get(tSearchUrl,querParameters:{"query":searchedMovie} )).thenThrow(Exception('Server error'));
    // act + assert
    expect(() => remoteDataSource.searchMovies(searchedMovie), throwsA(isA<Exception>()));
  });
});

}
