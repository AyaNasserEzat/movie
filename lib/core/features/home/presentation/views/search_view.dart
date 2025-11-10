import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies/core/features/home/domain/use_case/search_movie_use_case.dart';
import 'package:movies/core/features/home/presentation/cubits/search_cubit/search_cubit.dart';

import 'package:movies/core/features/home/presentation/views/widgets/search_view_body.dart';
import 'package:movies/core/servieces/serviec_locator.dart';


class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SearchCubit(sl<SearchMovieUseCase>()),
        child:SearchViewBody()
      ),
    );
  }
}
