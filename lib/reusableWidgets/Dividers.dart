import 'package:flutter/cupertino.dart';

class Dividers {
  static Widget verticalSeparator(double height) {
    return SizedBox(
      height: height,
    );
  }

  static Widget horizontalSeparator(double width) {
    return SizedBox(
      width: width,
    );
  }
}
