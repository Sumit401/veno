import 'package:assignment_wingman/JSONModels/UpdateProfileJSON.dart';
import 'package:assignment_wingman/httpRequest/updateProfileRequest.dart';
import 'package:flutter/material.dart';

import '../JSONModels/sendOTPJSON.dart';
import '../JSONModels/verifyOTPJSON.dart';
import '../httpRequest/sendOTPRequest.dart';
import '../httpRequest/verifyOTPRequest.dart';

class LoginProvider extends ChangeNotifier {
  String? number;
  String? userName;
  String? userEmail;

  SendOtpjsonModel? sendOTPResponse;
  VerifyOtpjsonModel? verifyOtpResponse;
  UpdateProfileJsonModel? updateProfileResponse;

  void getMobileNumber(data) {
    number = data;
    notifyListeners();
  }

  Future<void> sendOTPFunc() async {
    sendOTPResponse = await sendOTP(number.toString());
    print(sendOTPResponse?.status);
    notifyListeners();
  }

  Future<void> verifyOTPFunc(String otpData) async {
    verifyOtpResponse =
        await verifyOTP((sendOTPResponse?.requestId).toString(), otpData);
    notifyListeners();
  }

  void getEmail(String value) {
    userEmail = value;
    notifyListeners();
  }

  void getName(String value) {
    userName = value;
    notifyListeners();
  }

  Future<void> updateProfileFunc() async {
    if (userEmail != null && userName != null) {
      updateProfileResponse = await updateProfile(
          userName!, userEmail!, (verifyOtpResponse?.jwt).toString());
    }
    notifyListeners();
  }
}
