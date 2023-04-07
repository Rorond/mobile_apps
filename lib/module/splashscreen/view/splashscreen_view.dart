import 'package:flutter/material.dart';
import '../controller/splashscreen_controller.dart';
import 'package:mobile_apps/core.dart';
import 'package:get/get.dart';

class SplashscreenView extends StatelessWidget {
  const SplashscreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashscreenController>(
      init: SplashscreenController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
            body: Center(
          child: Text(
            "WELCOME",
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900]),
          ),
        ));
      },
    );
  }
}
