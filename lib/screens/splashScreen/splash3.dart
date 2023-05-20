import 'package:assignment_wingman/screens/loginScreen.dart';
import 'package:flutter/material.dart';

import '../../Styles/buttonStyles.dart';
import '../../reusableWidgets/Dividers.dart';
import '../../reusableWidgets/imageDec.dart';
import 'splashScreenContent.dart';

class Splash3 extends StatelessWidget {
  const Splash3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SplashScreenContent().splashScreenTopProgressBar(2),
          SplashScreenContent().splashScreenMainContent(2),
          loginButtons(context),
        ],
      ),
    );
  }

  Widget loginButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
              style: ButtonStyles.buttonStyleBlueColor(),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: const Text("Login", style: TextStyle(fontSize: 16))),
          Dividers.verticalSeparator(10),
          ElevatedButton(
              style: ButtonStyles.buttonStyleLightBlueColor(),
              onPressed: () {
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(ImageDec.googleLogo,height: 20,fit: BoxFit.fitWidth),
                  Dividers.horizontalSeparator(10),
                  const Text("Continue With Google", style: TextStyle(fontSize: 16, color: Colors.black)),
                ],
              )),
          Dividers.verticalSeparator(10),
          ElevatedButton(
              style: ButtonStyles.buttonStyleLightBlueColor(),
              onPressed: () {
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(ImageDec.appleLogo,height: 20, fit: BoxFit.fitWidth),
                  Dividers.horizontalSeparator(10),
                  const Text("Continue With Apple", style: TextStyle(fontSize: 16, color: Colors.black)),
                ],
              ))
        ],
      ),
    );
  }
}
