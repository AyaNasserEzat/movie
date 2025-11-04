
import 'package:movies/core/database/api/api_consumer.dart';
import 'package:movies/core/database/api/end_point.dart';
import 'package:movies/core/features/home/data/models/movie_detail_model/movie_detail_model.dart';

import 'package:movies/core/features/home/data/models/movie_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getPopularMovie();
  Future<List<MovieModel>> getTopRated();
  Future<List<MovieModel>> getNowPlaying();
    Future<MovieDetailModel> getMovieDetails(int id);
        Future<List<MovieModel>> getSimilarMovies(int id);
                Future<List<MovieModel>> searchMovies(String movie);
}

class MovieRemoteDataSourceImp extends MovieRemoteDataSource {
  final ApiConsumer api;

  MovieRemoteDataSourceImp({required this.api});
  @override
  Future<List<MovieModel>> getPopularMovie() async {
    List<MovieModel> movieList = [];
    final res = await api.get(
      "${EndPoint.getPopularMovieEndpoint}?api_key=${EndPoint.apiKey}",
    );
    for (var movie in res["results"]) {
      movieList.add(MovieModel.fromJson(movie));
    }
    return movieList;
  }

  @override
  Future<List<MovieModel>> getTopRated() async {
    List<MovieModel> movieList = [];
    final res = await api.get(
      "${EndPoint.getTopRatedMovieEndpoint}?api_key=${EndPoint.apiKey}",
    );
    for (var movie in res["results"]) {
      movieList.add(MovieModel.fromJson(movie));
    }
    return movieList;
  }

  @override
  Future<List<MovieModel>> getNowPlaying() async {
    List<MovieModel> movieList = [];
    final res = await api.get(
      "${EndPoint.getNowPlayingMovieEndpoint}?api_key=${EndPoint.apiKey}",
    );
    for (var movie in res["results"]) {
      movieList.add(MovieModel.fromJson(movie));
    }
    return movieList;
  }
  
  @override
  Future<MovieDetailModel> getMovieDetails(int id)async {
    final MovieDetailModel movieDetailModel;
 final  response=await api.get("${EndPoint.getMovieDetailsEndpoint}/$id?api_key=${EndPoint.apiKey}");
 movieDetailModel= MovieDetailModel.fromJson(response);
 return movieDetailModel;
  }
  
  @override
  Future<List<MovieModel>> getSimilarMovies(int id) async{
    List<MovieModel> movieList = [];
    final res = await api.get(
      "${EndPoint.getMovieDetailsEndpoint}$id/recommendations?api_key=${EndPoint.apiKey}",
    );
    for (var movie in res["results"]) {
      movieList.add(MovieModel.fromJson(movie));
    }
    return movieList;
  }
  
  @override
  Future<List<MovieModel>> searchMovies(String movie)async {
  List<MovieModel> movieList = [];
    final res = await api.get(
      "${EndPoint.searchEndpoint}?api_key=${EndPoint.apiKey}",
      querParameters: {
        "query":movie
      }
      
    );
    for (var movie in res["results"]) {
      movieList.add(MovieModel.fromJson(movie));
    }
    return movieList;
  }
}
