import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../Styles/buttonStyles.dart';
import '../providers/loginProvider.dart';
import '../reusableWidgets/Dividers.dart';
import '../reusableWidgets/appBar.dart';
import '../reusableWidgets/flutterToast.dart';
import '../reusableWidgets/imageDec.dart';
import '../reusableWidgets/textInputDecoration.dart';
import 'homePage.dart';

class FillDetailsScreen extends StatefulWidget {
  const FillDetailsScreen({Key? key}) : super(key: key);

  @override
  State<FillDetailsScreen> createState() => _FillDetailsScreenState();
}

class _FillDetailsScreenState extends State<FillDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            headingText(),
            const Spacer(),
            textInputName(),
            Dividers.verticalSeparator(50),
            textInputEmail(),
            const Spacer(),
            const Spacer(),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget headingText() {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: ImageDec.enterName,
              style: TextStyle(
                  fontSize: 0.2 * 35.w,
                  fontWeight: FontWeight.bold,
                  color: Colors.black) // non-emoji characters
              ),
          const TextSpan(
            text: ' 👋', // emoji characters
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'EmojiOne',
            ),
          ),
        ],
      ),
    );
  }

  Widget textInputName() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25.w),
      child: Consumer<LoginProvider>(
        builder: (context, loginProvider, child) {
          return TextFormField(
            style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                color: Colors.black),
            keyboardType: TextInputType.name,
            decoration: textInputDecoration("Enter your Name"),
            onChanged: (value) {
              loginProvider.getName(value);
            },
          );
        },
      ),
    );
  }

  Widget textInputEmail() {
    return Consumer<LoginProvider>(
      builder: (context, loginProvider, child) {
        return TextFormField(
          style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
              color: Colors.black),
          keyboardType: TextInputType.name,
          decoration: textInputDecoration("Enter your Email"),
          onChanged: (value) {
            loginProvider.getEmail(value);
          },
        );
      },
    );
  }

  Widget submitButton() {
    return Consumer<LoginProvider>(
      builder: (context, loginProvider, child) {
        return ElevatedButton(
            style: ButtonStyles.buttonStyleBlueColor(),
            onPressed: () async {
              if (loginProvider.userName != "" &&
                  loginProvider.userEmail != "") {
                await loginProvider.updateProfileFunc();

                if (loginProvider.updateProfileResponse?.status == true) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const HomeScreen()));
                } else {
                  showFlutterToast(
                      (loginProvider.updateProfileResponse?.response)
                          .toString());
                }
              }
            },
            child: const Text(ImageDec.next));
      },
    );
  }
}
