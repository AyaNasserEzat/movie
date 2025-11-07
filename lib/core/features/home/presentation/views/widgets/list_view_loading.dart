import 'package:flutter/material.dart';
import 'package:movies/core/features/home/presentation/views/widgets/film_img_skeletonizer.dart';
import 'package:movies/core/features/home/presentation/views/widgets/film_item_comtainer_skeletonizer.dart';

class ListViewLoading extends StatelessWidget {
  const ListViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: 7,
        itemBuilder: (buildContext, index) {
          return Center(
            child:FilmItemComtainerSkeletonizer()
      
          );
        
        },
      ),
    );
  }
}