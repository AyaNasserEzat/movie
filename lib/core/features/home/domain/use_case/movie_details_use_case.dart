import 'package:dartz/dartz.dart';
import 'package:movies/core/errors/failure.dart';
import 'package:movies/core/features/home/data/models/movie_detail_model/movie_detail_model.dart';
import 'package:movies/core/features/home/domain/repo/movie_repo.dart';

class MovieDetailsUseCase {
  final MovieRepo movieRepo;

  MovieDetailsUseCase({required this.movieRepo});
  Future<Either<Failure,MovieDetailModel>> call(int id)async{
 return  await movieRepo.getDetailsMovie(id);
  }
}