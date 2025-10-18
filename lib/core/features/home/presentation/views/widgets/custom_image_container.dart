import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImageContainer extends StatelessWidget {
  const CustomImageContainer({super.key,   required this.imageUrl});

final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.9/4,
      child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
        child: CachedNetworkImage(
          imageUrl: "https://image.tmdb.org/t/p/w500$imageUrl",
        fit: BoxFit.cover,
        errorWidget: (context, url, error) => Icon(Icons.error),),
      ),
    );
  }
}