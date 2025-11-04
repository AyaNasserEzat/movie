import 'package:dartz/dartz.dart';
import 'package:movies/core/errors/failure.dart';
import 'package:movies/core/features/home/data/models/movie_model.dart';
import 'package:movies/core/features/home/domain/repo/movie_repo.dart';

class SearchMovieUseCase {
  final MovieRepo movieRepo;

  SearchMovieUseCase({required this.movieRepo});
  Future<Either<Failure,List<MovieModel>>> call(String movie)async{
    return await movieRepo.searchMovies(movie);
  }

}