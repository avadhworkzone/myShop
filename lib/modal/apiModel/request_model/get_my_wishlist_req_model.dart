class GetMyWishListReqModel {
  String? action;
  String? userId;

  GetMyWishListReqModel({this.action, this.userId});

  GetMyWishListReqModel.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action'] = this.action ?? "getMyWishList";
    data['user_id'] = this.userId;
    return data;
  }
}
