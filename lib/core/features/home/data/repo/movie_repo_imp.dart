import 'package:dartz/dartz.dart';

import 'package:movies/core/errors/exceptions.dart';
import 'package:movies/core/errors/failure.dart';
import 'package:movies/core/features/home/data/data_source/remote_data_source/movie_remote_data_source.dart';
import 'package:movies/core/features/home/data/models/movie_detail_model/movie_detail_model.dart';
import 'package:movies/core/features/home/data/models/movie_model.dart';
import 'package:movies/core/features/home/domain/entitiy/movie_entity.dart';
import 'package:movies/core/features/home/domain/repo/movie_repo.dart';

class MovieRepoImp extends MovieRepo {
  final MovieRemoteDataSource movieRemoteDataSource;

  MovieRepoImp({required this.movieRemoteDataSource});
  @override
  Future<Either<Failure, List<MovieEntity>>> getPopularMovie() async {
    try {
      List<MovieEntity> res = await movieRemoteDataSource.getPopularMovie();
      return right(res);
    } on ServerException catch (e) {
      return left(Failure(errorMessage: e.errorModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovie() async {
    try {
      List<MovieEntity> res = await movieRemoteDataSource.getNowPlaying();
      return right(res);
    } on ServerException catch (e) {
      return left(Failure(errorMessage: e.errorModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingdMovie() async {
    try {
      List<MovieEntity> res = await movieRemoteDataSource.getNowPlaying();
      return right(res);
    } on ServerException catch (e) {
      return left(Failure(errorMessage: e.errorModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetailModel>> getDetailsMovie(int id ) async{
  try {
  MovieDetailModel model=await movieRemoteDataSource.getMovieDetails(id);
  return right(model);
} on ServerException catch (e) {
return left(Failure(errorMessage: e.errorModel.errorMessage));
}

  }
  
  @override
  Future<Either<Failure, List<MovieModel>>> getSimilarMovies(int id) async{
   try {
  final model=await movieRemoteDataSource.getSimilarMovies(id);
  return right(model);
} on ServerException catch (e) {
return left(Failure(errorMessage: e.errorModel.errorMessage));
}
  }
  
  @override
  Future<Either<Failure, List<MovieModel>>> searchMovies(String movie) async{
    try {
  final model=await movieRemoteDataSource.searchMovies(movie);
  return right(model);
} on ServerException catch (e) {
return left(Failure(errorMessage: e.errorModel.errorMessage));
}
  }
}
