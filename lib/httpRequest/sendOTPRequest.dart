import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../JSONModels/sendOTPJSON.dart';

Future<SendOtpjsonModel?> sendOTP(String mobile) async {
  var uri = Uri.parse("https://test-otp-api.7474224.xyz/sendotp.php");
  String body = '{"mobile":"$mobile"}';

  var client = await http.post(uri, body: body);
  debugPrint(client.body);
  return sendOtpjsonModelFromJson(client.body);
}