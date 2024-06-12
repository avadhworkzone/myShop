// class ForgotPasswordReqModel {
//   String? action;
//   String? username;
//   String? userType;
//
//   ForgotPasswordReqModel({this.action, this.username, this.userType});
//
//   ForgotPasswordReqModel.fromJson(Map<String, dynamic> json) {
//     action = json['action'];
//     username = json['username'];
//     userType = json['user_type'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['action'] = this.action ?? "forgotpwdsendotp";
//     data['username'] = this.username;
//     data['user_type'] = this.userType ?? "1";
//     return data;
//   }
// }
class ForgotPasswordReqModel {
  String? action;
  String? username;

  ForgotPasswordReqModel({this.action, this.username});

  ForgotPasswordReqModel.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action'] = this.action ?? "forgotpwdsendotp";
    data['username'] = this.username;
    return data;
  }
}
