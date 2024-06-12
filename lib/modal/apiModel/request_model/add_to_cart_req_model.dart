class ProductAddToCartReqModel {
  String? action;
  String? productId;
  String? userId;
  String? qty;

  ProductAddToCartReqModel(
      {this.action, this.productId, this.userId, this.qty});

  ProductAddToCartReqModel.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    productId = json['product_id'];
    userId = json['user_id'];
    qty = json['qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action'] = this.action ?? "addToCart";
    data['product_id'] = this.productId;
    data['user_id'] = this.userId;
    data['qty'] = this.qty;
    return data;
  }
}
