import 'dart:convert';

LogInReqModel logInReqModelFromJson(String str) =>
    LogInReqModel.fromJson(json.decode(str));

String logInReqModelToJson(LogInReqModel data) => json.encode(data.toJson());

class LogInReqModel {
  LogInReqModel({
    this.action,
    this.email,
    this.password,
    this.mobileToken,
  });

  String? action;
  String? email;
  String? password;
  String? mobileToken;

  factory LogInReqModel.fromJson(Map<String, dynamic> json) => LogInReqModel(
        action: json["action"],
        email: json["email"],
        password: json["password"],
        mobileToken: json["mobile_token"],
      );

  Map<String, dynamic> toJson() => {
        "action": action ?? 'login',
        "email": email,
        "password": password,
        "mobile_token": mobileToken ?? "",
      };
}
