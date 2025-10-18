import 'package:flutter/material.dart';
import 'package:movies/core/contstant/app_color.dart';

class FilmNameColom extends StatelessWidget {
  const FilmNameColom({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
       
            spacing: 10,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.red
                    ),
                  ),
                  Text(" NOW PLAING",style: TextStyle(color: AppColor.white),)
                ],
              ),
                 Text("The Bad Guy",style: TextStyle(color: AppColor.white,fontSize: 24),)
            ],
          );
  }
}