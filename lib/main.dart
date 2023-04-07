import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_apps/core.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0356F1),
          primary: const Color(0xFF0356F1),
        ),
      ),
      home: const SplashscreenView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
