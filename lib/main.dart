import 'package:flutter/material.dart';
import 'package:movies/core/contstant/app_color.dart';
import 'package:movies/core/routs/app_router.dart';
import 'package:movies/core/servieces/serviec_locator.dart';

void main() {
  setupServicesLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = AppRouter();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router.router,
      theme: ThemeData(scaffoldBackgroundColor: AppColor.backGroundColor),
    );
  }
}
