import 'package:flutter/material.dart';

import 'splashScreenContent.dart';

class Splash2 extends StatelessWidget {
  const Splash2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SplashScreenContent().splashScreenTopProgressBar(1),
          SplashScreenContent().splashScreenMainContent(1),
          SplashScreenContent().navigationButtons(context, 1),
        ],
      ),
    );
  }
}
