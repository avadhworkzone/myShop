class ResetPasswordReqModel {
  String? action;
  String? userId;
  String? otp;
  String? newPassword;

  ResetPasswordReqModel({this.action, this.userId, this.otp, this.newPassword});

  ResetPasswordReqModel.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    userId = json['user_id'];
    otp = json['otp'];
    newPassword = json['new_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action'] = this.action ?? "resetPassword";
    data['user_id'] = this.userId;
    data['otp'] = this.otp;
    data['new_password'] = this.newPassword;
    return data;
  }
}
