import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/features/home/presentation/cubits/movie_details_cubit/movie_details_cubit.dart';

import 'package:movies/core/features/home/presentation/views/widgets/movie_details_body.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({super.key, required this.id});
final int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => MovieDetailsCubit()..getMovieDetails(id),
        child: SingleChildScrollView(
          child:MovieDetailsBody()
        ),
      ),
    );
  }
}
