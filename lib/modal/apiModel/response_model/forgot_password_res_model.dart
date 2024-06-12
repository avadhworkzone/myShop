// class ForgotPasswordResModel {
//   String? userId;
//   String? data;
//   String? status;
//
//   ForgotPasswordResModel({this.userId, this.data, this.status});
//
//   ForgotPasswordResModel.fromJson(Map<String, dynamic> json) {
//     userId = json['user_id'];
//     data = json['data'];
//     status = json['status'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['user_id'] = this.userId;
//     data['data'] = this.data;
//     data['status'] = this.status;
//     return data;
//   }
// }
// To parse this JSON data, do
//
//     final forgotPasswordResModel = forgotPasswordResModelFromJson(jsonString);

import 'dart:convert';

ForgotPasswordResModel forgotPasswordResModelFromJson(String str) =>
    ForgotPasswordResModel.fromJson(json.decode(str));

String forgotPasswordResModelToJson(ForgotPasswordResModel data) =>
    json.encode(data.toJson());

class ForgotPasswordResModel {
  ForgotPasswordResModel({
    this.data,
    this.message,
    this.status,
  });

  List<Data>? data = [];
  String? message;
  String? status;

  factory ForgotPasswordResModel.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordResModel(
        data: json["status"] == "OK"
            ? List<Data>.from(json["data"].map((x) => Data.fromJson(x)))
            : [],
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
        "status": status,
      };
}

class Data {
  Data({
    this.userId,
  });

  String? userId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
      };
}
