class ProductAddToWishlistReqModel {
  String? action;
  String? productId;
  String? userId;

  ProductAddToWishlistReqModel({this.action, this.productId, this.userId});

  ProductAddToWishlistReqModel.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    productId = json['product_id'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action'] = this.action ?? "addWishList";
    data['product_id'] = this.productId;
    data['user_id'] = this.userId;
    return data;
  }
}
