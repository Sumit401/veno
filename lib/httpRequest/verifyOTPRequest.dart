import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../JSONModels/verifyOTPJSON.dart';

Future<VerifyOtpjsonModel?> verifyOTP(String reqID, String otpCode) async {
  var uri = Uri.parse("https://test-otp-api.7474224.xyz/verifyotp.php");
  String body = '{"request_id" : "$reqID","code" : "$otpCode"}';
  var client = await http.post(uri, body: body);
  debugPrint(client.body);
  return verifyOtpjsonModelFromJson(client.body);
}
