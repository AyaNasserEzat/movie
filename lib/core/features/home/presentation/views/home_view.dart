import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/core/features/home/presentation/views/widgets/custom_row.dart';
import 'package:movies/core/features/home/presentation/views/widgets/film_image.dart';
import 'package:movies/core/features/home/presentation/views/widgets/popular_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          spacing: 10,
          children: [
            FilmImage(),
            SizedBox(height: 10),
            CustomRow(
              text: "Popular",
              ontap: () {
                context.push("/popular");
              },
            ),
            PopularListView(),
            CustomRow(
              text: "Top Rated",
              ontap: () {
                context.push("/topRated");
              },
            ),
            PopularListView(),
          ],
        ),
      ),
    );
  }
}
