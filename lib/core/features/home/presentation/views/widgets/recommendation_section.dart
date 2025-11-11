import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/contstant/app_color.dart';
import 'package:movies/core/features/home/domain/use_case/get_similar_movies.dart';
import 'package:movies/core/features/home/presentation/cubits/get_similar-movie/similar_movie_cubit.dart';
import 'package:movies/core/features/home/presentation/cubits/get_similar-movie/similar_movie_state.dart';
import 'package:movies/core/features/home/presentation/views/widgets/custom_grid_view.dart';
import 'package:movies/core/servieces/serviec_locator.dart';

class RecommendationSection extends StatelessWidget {
  const RecommendationSection({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
    
        children: [
          SizedBox(height: 15),
          Text(
            "MORE LIKE THIS",
            style: TextStyle(color: AppColor.gery, fontSize: 24),
          ),
          BlocBuilder<SimilarMovieCubit, SimilarMovieState>(
            builder: (context, state) {
              if (state is SimilarMoviesInitialSuccess) {
                return CustomGridView(movies: state.movies);
              } else if (state is SimilarMoviesInitialFailure) {
                return Center(child: Text(state.message));
              } else if (state is SimilarMoviesInitialLoading) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Text("error");
              }
            },
          ),
        ],
      ),
    );
  }
}
