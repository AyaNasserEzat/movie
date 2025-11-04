import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/core/features/home/presentation/popular_movie_view.dart';
import 'package:movies/core/features/home/presentation/views/home_view.dart';
import 'package:movies/core/features/home/presentation/views/movie_details_view.dart';
import 'package:movies/core/features/home/presentation/views/search_view.dart';
import 'package:movies/core/features/home/presentation/views/top_rated_view.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: "/", builder: (context, state) => HomeView()),
      GoRoute(
        path: "/popular",
        builder: (context, state) => PopularMovieView(),
      ),
      GoRoute(path: "/topRated", builder: (context, state) => TopRatedView()),
      GoRoute(
        path: "/movieDetails",
        builder: (context, state){
final movieId = state.extra as int;
    return MovieDetailsView(id: movieId);
        }
     
      ),
        GoRoute(
        path: "/searchView",
        builder: (context, state) => SearchView(),
      ),
    ],
    errorBuilder:
        (context, state) =>
            Scaffold(body: Center(child: Text('Page not found'))),
  );
}
