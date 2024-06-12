class ChangePasswordReqModel {
  String? action;
  String? userId;
  String? currentPassword;
  String? newPassword;

  ChangePasswordReqModel(
      {this.action, this.userId, this.currentPassword, this.newPassword});

  ChangePasswordReqModel.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    userId = json['user_id'];
    currentPassword = json['current_password'];
    newPassword = json['new_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action'] = this.action ?? "changePassword";
    data['user_id'] = this.userId;
    data['current_password'] = this.currentPassword;
    data['new_password'] = this.newPassword;
    return data;
  }
}
