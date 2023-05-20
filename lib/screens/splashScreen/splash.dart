import 'package:flutter/material.dart';

import 'splashScreenContent.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SplashScreenContent().splashScreenTopProgressBar(0),
          SplashScreenContent().splashScreenMainContent(0),
          SplashScreenContent().navigationButtons(context, 0),
        ],
      ),
    );
  }
}
