import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qubehealth/pages/splashscreen/controller/slpashscreen_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashScreenController = Get.find<SplashScreenController>();

  @override
  void initState() {
    splashScreenController.onPageInitialized();
    Timer(
      const Duration(seconds: 3),
      () async => await splashScreenController.navigateToPage(
        "/setting",
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Align(
            alignment: Alignment.center,
            child: Text("SplashScreen"),
          ),
        ],
      ),
    );
  }
}
