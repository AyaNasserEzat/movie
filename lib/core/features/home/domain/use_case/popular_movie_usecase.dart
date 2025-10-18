import 'package:dartz/dartz.dart';
import 'package:movies/core/errors/failure.dart';
import 'package:movies/core/features/home/domain/entitiy/movie_entity.dart';
import 'package:movies/core/features/home/domain/repo/movie_repo.dart';

class PopularMovieUsecase {
  final MovieRepo movieRepo;

  PopularMovieUsecase({required this.movieRepo});
Future<Either<Failure,List<MovieEntity>>>  call(){
    return movieRepo.getPopularMovie();
  }

}