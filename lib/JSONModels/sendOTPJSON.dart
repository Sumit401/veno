import 'dart:convert';

SendOtpjsonModel sendOtpjsonModelFromJson(String str) => SendOtpjsonModel.fromJson(json.decode(str));

String sendOtpjsonModelToJson(SendOtpjsonModel data) => json.encode(data.toJson());

class SendOtpjsonModel {
  bool? status;
  String? response;
  String? requestId;

  SendOtpjsonModel({
    this.status,
    this.response,
    this.requestId,
  });

  factory SendOtpjsonModel.fromJson(Map<String, dynamic> json) => SendOtpjsonModel(
    status: json["status"],
    response: json["response"],
    requestId: json["request_id"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "response": response,
    "request_id": requestId,
  };
}
