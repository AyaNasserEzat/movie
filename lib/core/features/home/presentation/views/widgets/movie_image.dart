import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/core/contstant/app_color.dart';

class MovieImage extends StatelessWidget {
  const MovieImage({super.key, required this.imgUrl});
final String imgUrl;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
  
         CachedNetworkImage(
                      imageUrl:
                          "https://image.tmdb.org/t/p/w500${imgUrl}",
                      width: double.infinity,
                      height: 360,
                      fit: BoxFit.cover,
                    ),
                        Positioned(
          top: 50,
          child: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(Icons.arrow_back_ios_rounded,color: AppColor.white,),
          ),
        ),
      ],
    );
  }
}
