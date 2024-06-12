class RemoveWishlistReqModel {
  String? action;
  String? productId;
  String? userId;

  RemoveWishlistReqModel({this.action, this.productId, this.userId});

  RemoveWishlistReqModel.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    productId = json['product_id'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action'] = this.action ?? "removeWishList";
    data['product_id'] = this.productId;
    data['user_id'] = this.userId;
    return data;
  }
}
