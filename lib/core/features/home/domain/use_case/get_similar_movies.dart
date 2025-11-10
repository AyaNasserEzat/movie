import 'package:dartz/dartz.dart';
import 'package:movies/core/errors/failure.dart';
import 'package:movies/core/features/home/data/models/movie_model.dart';
import 'package:movies/core/features/home/domain/entitiy/movie_entity.dart';
import 'package:movies/core/features/home/domain/repo/movie_repo.dart';

class GetSimilarMoviesUseCase {
   final MovieRepo movieRepo;

  GetSimilarMoviesUseCase({required this.movieRepo});
  Future<Either<Failure,List<MovieEntity>>> call(int id)async{
 return  await movieRepo.getSimilarMovies(id);
  }
}