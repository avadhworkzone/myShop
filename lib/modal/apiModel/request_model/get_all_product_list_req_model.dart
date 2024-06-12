// class GetAllProductListReqModel {
//   String? action;
//
//   GetAllProductListReqModel({this.action});
//
//   GetAllProductListReqModel.fromJson(Map<String, dynamic> json) {
//     action = json['action'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['action'] = this.action ?? "getallProductList";
//     return data;
//   }
// }
/// new
// class GetAllProductListReqModel {
//   String? action;
//   String? userId;
//
//   GetAllProductListReqModel({this.action, this.userId});
//
//   GetAllProductListReqModel.fromJson(Map<String, dynamic> json) {
//     action = json['action'];
//     userId = json['user_id'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['action'] = this.action ?? "getallProductList";
//     data['user_id'] = this.userId;
//     return data;
//   }
// }
/// new 1
class GetAllProductListReqModel {
  String? action;
  String? type;
  String? orderBy;
  String? userId;

  GetAllProductListReqModel(
      {this.action, this.type, this.orderBy, this.userId});

  GetAllProductListReqModel.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    type = json['type'];
    orderBy = json['order_by'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action'] = this.action ?? "getallProductList";
    data['type'] = this.type;
    data['order_by'] = this.orderBy;
    data['user_id'] = this.userId;
    return data;
  }
}
