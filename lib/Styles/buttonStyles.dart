import 'package:assignment_wingman/reusableWidgets/colors.dart';
import 'package:flutter/material.dart';

class ButtonStyles {
  static ButtonStyle buttonStyleBlueColor(){
    return ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15),
        backgroundColor: ColorCodes.primaryBlue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)));
  }

  static ButtonStyle buttonStyleLightBlueColor(){
    return ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15),
        backgroundColor: ColorCodes.lightBlue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)));
  }
}