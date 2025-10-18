import 'package:dartz/dartz.dart';

import 'package:movies/core/errors/exceptions.dart';
import 'package:movies/core/errors/failure.dart';
import 'package:movies/core/features/home/data/data_source/remote_data_source/movie_remote_data_source.dart';
import 'package:movies/core/features/home/domain/entitiy/movie_entity.dart';
import 'package:movies/core/features/home/domain/repo/movie_repo.dart';

class MovieRepoImp  extends MovieRepo{
  final MovieRemoteDataSource movieRemoteDataSource;

  MovieRepoImp({required this.movieRemoteDataSource});
  @override
  Future<Either<Failure, List<MovieEntity>>> getPopularMovie( )async {
    try {
 List<MovieEntity> res=await movieRemoteDataSource.getPopularMovie();
 return right(res);
} on ServerException catch (e) {

return left(Failure(errorMessage: e.errorModel.errorMessage));
}

  }
}