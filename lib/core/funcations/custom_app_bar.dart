import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/core/contstant/app_color.dart';

buildAppBar(String text, BuildContext context) {
  return AppBar(
    title: Text(text, style: TextStyle(color: AppColor.white)),
    scrolledUnderElevation: 0,
    backgroundColor: Colors.black54,
    centerTitle: true,
    actions: [
      IconButton(onPressed: (){
        context.push("/searchView");
      }, icon: Icon(Icons.search))
    ],
    leading: IconButton(
      onPressed: () {
        context.pop();
      },
      icon: Icon(Icons.arrow_back_ios_new, color: AppColor.white),
      
    ),
  );
}
