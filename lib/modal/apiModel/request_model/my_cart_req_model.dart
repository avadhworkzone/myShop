class MyCartListReqModel {
  String? action;
  String? userId;

  MyCartListReqModel({this.action, this.userId});

  MyCartListReqModel.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action'] = this.action ?? "getMyCartList";
    data['user_id'] = this.userId;
    return data;
  }
}
