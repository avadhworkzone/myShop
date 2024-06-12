// class MyCartListResModel {
//   String? status;
//   List<Data>? data;
//
//   MyCartListResModel({this.status, this.data});
//
//   MyCartListResModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Data {
//   String? productId;
//   String? product;
//   String? price;
//   String? mrp;
//   String? qty;
//   String? img;
//
//   Data(
//       {this.productId, this.product, this.price, this.mrp, this.qty, this.img});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     productId = json['product_id'];
//     product = json['product'];
//     price = json['price'];
//     mrp = json['mrp'];
//     qty = json['qty'];
//     img = json['img'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['product_id'] = this.productId;
//     data['product'] = this.product;
//     data['price'] = this.price;
//     data['mrp'] = this.mrp;
//     data['qty'] = this.qty;
//     data['img'] = this.img;
//     return data;
//   }
// }
// To parse this JSON data, do
//
//     final myCartListResModel = myCartListResModelFromJson(jsonString);

import 'dart:convert';

MyCartListResModel myCartListResModelFromJson(String str) =>
    MyCartListResModel.fromJson(json.decode(str));

String myCartListResModelToJson(MyCartListResModel data) =>
    json.encode(data.toJson());

class MyCartListResModel {
  MyCartListResModel({
    this.status,
    this.data,
  });

  String? status;
  List<Data>? data = [];

  factory MyCartListResModel.fromJson(Map<String, dynamic> json) =>
      MyCartListResModel(
          status: json["status"],
          data: json["status"] == "OK"
              ? List<Data>.from(json["data"].map((x) => Data.fromJson(x)))
              : []);

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Data {
  Data({
    this.productId,
    this.product,
    this.price,
    this.mrp,
    this.qty,
    this.img,
  });

  String? productId;
  String? product;
  String? price;
  String? mrp;
  String? qty;
  String? img;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        productId: json["product_id"],
        product: json["product"],
        price: json["price"],
        mrp: json["mrp"],
        qty: json["qty"],
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product": product,
        "price": price,
        "mrp": mrp,
        "qty": qty,
        "img": img,
      };
}
