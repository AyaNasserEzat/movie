import 'package:dartz/dartz.dart';
import 'package:movies/core/errors/failure.dart';
import 'package:movies/core/features/home/domain/entitiy/movie_entity.dart';
import 'package:movies/core/features/home/domain/repo/movie_repo.dart';

class NowPlayingUseCase {
  final MovieRepo movieRepo;

  NowPlayingUseCase({required this.movieRepo});
  Future<Either<Failure, List<MovieEntity>>> call() {
    return movieRepo.getNowPlayingdMovie();
  }
}
