class GetProductInfoReqModel {
  String? action;
  String? productId;

  GetProductInfoReqModel({this.action, this.productId});

  GetProductInfoReqModel.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action'] = this.action ?? "getProductInfo";
    data['product_id'] = this.productId;
    return data;
  }
}
