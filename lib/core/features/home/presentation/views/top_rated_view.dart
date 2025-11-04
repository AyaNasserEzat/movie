import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/features/home/presentation/cubits/top_rated_cubit/top_rated_cubit.dart';
import 'package:movies/core/features/home/presentation/views/widgets/top_rated_body.dart';
import 'package:movies/core/funcations/custom_app_bar.dart';

class TopRatedView extends StatelessWidget {
  const TopRatedView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TopRatedMovieCubit()..getTopRatedMovie(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: buildAppBar("Top Rated movie", context),
        body: TopRatedBody(),
      ),
    );
  }
}
