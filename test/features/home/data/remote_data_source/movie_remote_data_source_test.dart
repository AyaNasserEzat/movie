import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/core/database/api/api_consumer.dart';
import 'package:movies/core/database/api/end_point.dart';
import 'package:movies/core/features/home/data/data_source/remote_data_source/movie_remote_data_source.dart';

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
}
