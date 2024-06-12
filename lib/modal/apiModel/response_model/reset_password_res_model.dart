class ResetPasswordResModel {
  String? message;
  String? status;

  ResetPasswordResModel({this.message, this.status});

  ResetPasswordResModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}
