class ProductAddToCartResModel {
  String? status;
  String? msg;

  ProductAddToCartResModel({this.status, this.msg});

  ProductAddToCartResModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    return data;
  }
}
