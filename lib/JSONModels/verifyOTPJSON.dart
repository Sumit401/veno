import 'dart:convert';

VerifyOtpjsonModel verifyOtpjsonModelFromJson(String str) => VerifyOtpjsonModel.fromJson(json.decode(str));

String verifyOtpjsonModelToJson(VerifyOtpjsonModel data) => json.encode(data.toJson());

class VerifyOtpjsonModel {
  bool? status;
  bool? profileExists;
  String? jwt;
  String? response;

  VerifyOtpjsonModel({
    this.status,
    this.profileExists,
    this.jwt,
    this.response,
  });

  factory VerifyOtpjsonModel.fromJson(Map<String, dynamic> json) => VerifyOtpjsonModel(
    status: json["status"],
    profileExists: json["profile_exists"],
    jwt: json["jwt"],
    response: json["response"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "profile_exists": profileExists,
    "jwt": jwt,
    "response": response,
  };
}
