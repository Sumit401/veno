import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:sizer/sizer.dart';

import '../../Styles/buttonStyles.dart';
import '../../reusableWidgets/Dividers.dart';
import '../../reusableWidgets/colors.dart';
import '../../reusableWidgets/imageDec.dart';
import 'splash2.dart';
import 'splash3.dart';

class SplashScreenContent {
  Widget splashScreenTopProgressBar(index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 6,
          width: 18.w,
          decoration: BoxDecoration(
              color: ColorCodes.primaryBlue,
              borderRadius: BorderRadius.circular(20)),
        ),
        Dividers.horizontalSeparator(5),
        Container(
          height: 6,
          width: 18.w,
          decoration: BoxDecoration(
              color: index != 0 ? ColorCodes.primaryBlue : ColorCodes.lightBlue,
              borderRadius: BorderRadius.circular(20)),
        ),
        Dividers.horizontalSeparator(5),
        Container(
          height: 6,
          width: 18.w,
          decoration: BoxDecoration(
              color: index == 2 ? ColorCodes.primaryBlue : ColorCodes.lightBlue,
              borderRadius: BorderRadius.circular(20)),
        ),
      ],
    );
  }

  Widget splashScreenMainContent(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Image.asset(
                index == 0
                    ? ImageDec.splashImage1
                    : index == 1
                        ? ImageDec.splashImage2
                        : ImageDec.splashImage3,
                height: 200,
                fit: BoxFit.fitWidth)),
        Dividers.verticalSeparator(20),
        Center(child: Image.asset(ImageDec.logo)),
        Dividers.verticalSeparator(20),
        Text(
            index == 0
                ? ImageDec.manageDaily
                : index == 1
                    ? ImageDec.investBestStock
                    : ImageDec.savemoneyControl,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
        GradientText(
          index == 0
              ? ImageDec.expenses
              : index == 1
                  ? ImageDec.everyday
                  : ImageDec.budget,
          style: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          colors: const [
            ColorCodes.whiteBlueColor,
            ColorCodes.blueColor,
            ColorCodes.purpleColor,
          ],
        ),
        const Text(
          ImageDec.splashContent,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  Widget navigationButtons(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
              style: ButtonStyles.buttonStyleBlueColor(),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) =>
                        index == 0 ? const Splash2() : const Splash3()));
              },
              child: const Text("Next", style: TextStyle(fontSize: 16))),
          Dividers.verticalSeparator(15),
          ElevatedButton(
              style: ButtonStyles.buttonStyleLightBlueColor(),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const Splash3(),
                ));
              },
              child: const Text(
                "Skip",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ))
        ],
      ),
    );
  }
}
