class LogOutReqModel {
  String? action;
  String? userId;

  LogOutReqModel({this.action, this.userId});

  LogOutReqModel.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action'] = this.action ?? "logout";
    data['user_id'] = this.userId;
    return data;
  }
}
