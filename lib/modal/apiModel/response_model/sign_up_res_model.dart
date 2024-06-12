import 'dart:convert';

SignUpResModel signUpResModelFromJson(String str) =>
    SignUpResModel.fromJson(json.decode(str));

String signUpResModelToJson(SignUpResModel data) => json.encode(data.toJson());

class SignUpResModel {
  SignUpResModel({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  List<Data>? data = [];

  factory SignUpResModel.fromJson(Map<String, dynamic> json) => SignUpResModel(
        status: json["status"],
        message: json["message"],
        data: json["status"] == "OK"
            ? List<Data>.from(json["data"].map((x) => Data.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Data {
  Data({
    this.email,
    this.password,
  });

  String? email;
  String? password;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
