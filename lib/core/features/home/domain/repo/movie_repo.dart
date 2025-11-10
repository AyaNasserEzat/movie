import 'package:dartz/dartz.dart';
import 'package:movies/core/errors/failure.dart';
import 'package:movies/core/features/home/data/models/movie_detail_model/movie_detail_model.dart';
import 'package:movies/core/features/home/data/models/movie_model.dart';
import 'package:movies/core/features/home/domain/entitiy/movie_entity.dart';

abstract class MovieRepo {
  Future<Either<Failure, List<MovieEntity>>> getPopularMovie();
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovie();
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingdMovie();
   Future<Either<Failure, MovieDetailModel>>   getDetailsMovie(int id);
    Future<Either<Failure, List<MovieEntity>>>   getSimilarMovies(int id);
       Future<Either<Failure, List<MovieEntity>>>   searchMovies(String movie);
}
