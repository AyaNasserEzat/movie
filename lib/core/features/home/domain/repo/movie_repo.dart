import 'package:dartz/dartz.dart';
import 'package:movies/core/errors/failure.dart';
import 'package:movies/core/features/home/domain/entitiy/movie_entity.dart';

abstract class MovieRepo {
  Future<Either<Failure,List<MovieEntity>>> getPopularMovie();
}