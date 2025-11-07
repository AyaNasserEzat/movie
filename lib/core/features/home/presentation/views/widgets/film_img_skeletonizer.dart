import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/contstant/app_color.dart';
import 'package:movies/core/features/home/domain/entitiy/movie_entity.dart';
import 'package:movies/core/features/home/presentation/views/widgets/custom_stack.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FilmImgSkeletonizer extends StatelessWidget {
  const FilmImgSkeletonizer({super.key});

  @override
  Widget build(BuildContext context) {
    return   Skeletonizer(
          enabled: true,
                          effect: ShimmerEffect(baseColor: const Color.fromARGB(255, 77, 76, 76),highlightColor: Colors.grey),
             ignoreContainers: false,
          child:Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child:Image.asset("assets/cartoon_test.jpg",width: double.infinity,)
                  
                
                )
        );
  }
}