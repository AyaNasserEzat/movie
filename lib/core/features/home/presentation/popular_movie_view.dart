import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/features/home/domain/use_case/popular_movie_usecase.dart';

import 'package:movies/core/features/home/presentation/cubits/popular_movie_cubit/popular_movie_cubit.dart';

import 'package:movies/core/features/home/presentation/views/widgets/popular_move_body.dart';

import 'package:movies/core/funcations/custom_app_bar.dart';
import 'package:movies/core/servieces/serviec_locator.dart';

class PopularMovieView extends StatelessWidget {
  const PopularMovieView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PopularMovieCubit(
        sl<PopularMovieUsecase>()
      )..getPopularMovie(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: buildAppBar("popular movie", context),
        body: PopularMoveBody(),
      ),
    );
  }
}
