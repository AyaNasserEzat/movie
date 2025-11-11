import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/features/home/domain/use_case/get_similar_movies.dart';
import 'package:movies/core/features/home/domain/use_case/movie_details_use_case.dart';
import 'package:movies/core/features/home/presentation/cubits/get_similar-movie/similar_movie_cubit.dart';
import 'package:movies/core/features/home/presentation/cubits/movie_details_cubit/movie_details_cubit.dart';

import 'package:movies/core/features/home/presentation/views/widgets/movie_details_body.dart';
import 'package:movies/core/features/home/presentation/views/widgets/recommendation_section.dart';
import 'package:movies/core/servieces/serviec_locator.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({super.key, required this.id});
final int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
          create: (context) => MovieDetailsCubit(sl<MovieDetailsUseCase>())..getMovieDetails(id),
          ),
          BlocProvider(
      create: (BuildContext context) {
        return SimilarMovieCubit(sl<GetSimilarMoviesUseCase>())
          ..getSimilarMovies(id);
          },
          ),
        ],
             child: SingleChildScrollView(
            child:Column(
              children: [
                MovieDetailsBody(),
                  RecommendationSection(id: id,),
              ],
            )
          ),
        ),
      
    );
  }
}
