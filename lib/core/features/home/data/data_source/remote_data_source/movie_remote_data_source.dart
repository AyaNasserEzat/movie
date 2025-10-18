
import 'package:movies/core/database/api/api_consumer.dart';
import 'package:movies/core/database/api/end_point.dart';

import 'package:movies/core/features/home/data/models/movie_model.dart';


abstract class MovieRemoteDataSource {
 Future<List<MovieModel>> getPopularMovie();
}

class MovieRemoteDataSourceImp extends MovieRemoteDataSource{
  final ApiConsumer api ;

  MovieRemoteDataSourceImp({required this.api});
  @override
 Future<List<MovieModel>> getPopularMovie()async {
List<MovieModel> movieList=[];
final res=await api.get(EndPoint.getPopularMovieEndpoint+"?api_key=${EndPoint.apiKey}");
for (var movie in res["results"]) {
movieList.add( MovieModel.fromJson(movie));
}
return movieList;

 
  }

}