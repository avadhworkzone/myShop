class RemoveProductToCartReqModel {
  String? action;
  String? productId;
  String? userId;

  RemoveProductToCartReqModel({this.action, this.productId, this.userId});

  RemoveProductToCartReqModel.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    productId = json['product_id'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action'] = this.action ?? "removeCartProduct";
    data['product_id'] = this.productId;
    data['user_id'] = this.userId;
    return data;
  }
}
