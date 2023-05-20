import 'dart:convert';

UpdateProfileJsonModel updateProfileJsonModelFromJson(String str) => UpdateProfileJsonModel.fromJson(json.decode(str));

String updateProfileJsonModelToJson(UpdateProfileJsonModel data) => json.encode(data.toJson());

class UpdateProfileJsonModel {
  bool? status;
  String? response;

  UpdateProfileJsonModel({
    this.status,
    this.response,
  });

  factory UpdateProfileJsonModel.fromJson(Map<String, dynamic> json) => UpdateProfileJsonModel(
    status: json["status"],
    response: json["response"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "response": response,
  };
}
