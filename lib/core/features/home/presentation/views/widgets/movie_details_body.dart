import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies/core/features/home/domain/entitiy/movie_details_entity.dart';
import 'package:movies/core/features/home/presentation/cubits/movie_details_cubit/movie_details_cubit.dart';
import 'package:movies/core/features/home/presentation/cubits/movie_details_cubit/movie_details_state.dart';
import 'package:movies/core/features/home/presentation/views/widgets/movie_datils_section.dart';
import 'package:movies/core/features/home/presentation/views/widgets/movie_image.dart';
import 'package:movies/core/features/home/presentation/views/widgets/recommendation_section.dart';

class MovieDetailsBody extends StatelessWidget {
  const MovieDetailsBody({super.key, });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit,MovieDetailsState>(
            builder: (context,state) {
             if(state is MovieDetailsLoadingSuccess){
              final movie=state.movies;
          return    Column(
                children: [
                  MovieImage(imgUrl: movie.backdropPath!,),
                  MovieDatilsSection(movieDetailModel: movie,),
                  RecommendationSection(id: movie.id,),
                ],
              );
              }
else if (state is MovieDetailsFailure) {
              return Center(child: Text(state.message));
            } else {
              return CircularProgressIndicator();
            }
            }

      );
  }
}