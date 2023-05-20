import 'package:assignment_wingman/screens/homePage.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../providers/loginProvider.dart';
import '../reusableWidgets/Dividers.dart';
import '../reusableWidgets/appBar.dart';
import '../reusableWidgets/colors.dart';
import '../reusableWidgets/flutterToast.dart';
import '../reusableWidgets/imageDec.dart';
import 'FillDetailsScreen.dart';

class VerifyOTP extends StatefulWidget {
  const VerifyOTP({Key? key}) : super(key: key);

  @override
  State<VerifyOTP> createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(color: ColorCodes.primaryBlue, width: 2.5))),
        width: 12.w,
        height: 5.6.h,
        textStyle: const TextStyle(
            color: ColorCodes.primaryBlue,
            fontWeight: FontWeight.bold,
            fontSize: 27));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(ImageDec.verifyOTPText,
                    style: TextStyle(
                        fontSize: 0.2 * 40.w, fontWeight: FontWeight.bold)),
                Dividers.verticalSeparator(15),
                const Text(ImageDec.verifyOTPSubText,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        wordSpacing: 1.2,
                        letterSpacing: 1)),
                Dividers.verticalSeparator(10),
                Consumer<LoginProvider>(
                  builder: (context, loginProvider, child) {
                    return Text("+91${loginProvider.number.toString()}",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700));
                  },
                ),
              ],
            ),
            Container(height: 20.h),
            Consumer<LoginProvider>(
              builder: (context, loginProvider, child) {
                return Pinput(
                  length: 6,
                  androidSmsAutofillMethod:
                      AndroidSmsAutofillMethod.smsUserConsentApi,
                  listenForMultipleSmsOnAndroid: true,
                  defaultPinTheme: defaultPinTheme,
                  hapticFeedbackType: HapticFeedbackType.lightImpact,
                  onCompleted: (pin) async {
                    debugPrint('onCompleted: $pin');
                    await loginProvider.verifyOTPFunc(pin);
                    if (loginProvider.verifyOtpResponse?.status == true && loginProvider.verifyOtpResponse?.profileExists == true) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const HomeScreen()));

                    } else if(loginProvider.verifyOtpResponse?.status == true && loginProvider.verifyOtpResponse?.profileExists == false){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const FillDetailsScreen()));
                    }else {
                      print("hi");
                      showFlutterToast((loginProvider.verifyOtpResponse?.response?.toUpperCase()).toString());
                    }
                  },
                  onChanged: (value) {
                    debugPrint('onChanged: $value');
                  },
                  cursor: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 9),
                        width: 5.w,
                        height: 1,
                        color: Colors.white,
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
