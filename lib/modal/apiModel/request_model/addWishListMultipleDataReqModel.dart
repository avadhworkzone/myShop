class addWishListMultipleDataReqModel {
  String? action;
  List<String>? productId;
  String? userId;

  addWishListMultipleDataReqModel({this.action, this.productId, this.userId});

  addWishListMultipleDataReqModel.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    productId = json['product_id'].cast<String>();
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action'] = this.action ?? "addWishListMultiple";
    data['product_id'] = this.productId;
    data['user_id'] = this.userId;
    return data;
  }
}
