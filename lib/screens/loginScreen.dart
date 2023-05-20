import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../Styles/buttonStyles.dart';
import '../providers/loginProvider.dart';
import '../reusableWidgets/Dividers.dart';
import '../reusableWidgets/appBar.dart';
import '../reusableWidgets/colors.dart';
import '../reusableWidgets/imageDec.dart';
import 'verifyOtp.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                headingLoginScreen(),
                Dividers.verticalSeparator(10),
                subTextLoginScreen(),
                Dividers.verticalSeparator(30),
                inputFieldLoginScreen(),
              ],
            ),
            submitButtonLoginScreen()
          ],
        ),
      ),
    );
  }

  headingLoginScreen() {
    return Text(ImageDec.signupLogin,
        style: TextStyle(fontSize: 0.2 * 39.w, fontWeight: FontWeight.bold));
  }

  subTextLoginScreen() {
    return const Text(ImageDec.loginSubText,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400));
  }

  inputFieldLoginScreen() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(ImageDec.indianFlag, width: 35),
        Dividers.horizontalSeparator(10),
        const Text("+91",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
        Dividers.horizontalSeparator(5),
        Container(
          width: 1,
          color: Colors.black,
          height: 25,
        ),
        Dividers.horizontalSeparator(5),
        SizedBox(
            width: 45.w,
            child: Consumer<LoginProvider>(
              builder: (context, loginProvider, child) {
                return TextFormField(
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      color: Colors.black),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                  ],
                  onChanged: (value) {
                    loginProvider.getMobileNumber(value);
                  },
                  showCursor: false,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "(000)000-00-00",
                      hintStyle: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 1.5,
                          color: Colors.black54)),
                );
              },
            )),
      ],
    );
  }

  submitButtonLoginScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Consumer<LoginProvider>(
          builder: (context, loginProvider, child) {
            return ElevatedButton(
                style: ButtonStyles.buttonStyleBlueColor(),
                onPressed: () async {
                  if (loginProvider.number?.length == 10) {
                    loginProvider.sendOTPFunc();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const VerifyOTP()));
                  }
                },
                child: const Text(ImageDec.continueText));
          },
        ),
        Dividers.verticalSeparator(15),
        const Text(
          ImageDec.continueSubText,
          textAlign: TextAlign.center,
        ),
        Dividers.verticalSeparator(3),
        const Text(
          ImageDec.termsPolicy,
          textAlign: TextAlign.center,
          style: TextStyle(color: ColorCodes.primaryBlue),
        )
      ],
    );
  }
}
