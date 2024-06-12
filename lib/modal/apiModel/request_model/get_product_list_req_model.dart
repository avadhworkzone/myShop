// class GetProductListReqModel {
//   String? action;
//   String? categoryId;
//
//   GetProductListReqModel({this.action, this.categoryId});
//
//   GetProductListReqModel.fromJson(Map<String, dynamic> json) {
//     action = json['action'];
//     categoryId = json['category_id'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['action'] = this.action ?? "getProductList";
//     data['category_id'] = this.categoryId;
//     return data;
//   }
// }
class GetProductListReqModel {
  String? action;
  String? categoryId;

  GetProductListReqModel({this.action, this.categoryId});

  GetProductListReqModel.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action'] = this.action ?? "getProductList";
    data['category_id'] = this.categoryId;
    return data;
  }
}
