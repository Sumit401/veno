import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../JSONModels/UpdateProfileJSON.dart';

Future<UpdateProfileJsonModel?> updateProfile(
    String name, String email, String jwt) async {
  var uri = Uri.parse("https://test-otp-api.7474224.xyz/profilesubmit.php");
  String body = '{"name":"$name","email":"$email"}';
  Map<String, String> headers = {"Token": jwt};

  var client = await http.post(uri, body: body, headers: headers);
  debugPrint(client.body);
  return updateProfileJsonModelFromJson(client.body);
}
