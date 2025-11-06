import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:movies/core/errors/error_model.dart';
import 'package:movies/core/errors/failure.dart';
import 'package:movies/core/errors/exceptions.dart';
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
}
