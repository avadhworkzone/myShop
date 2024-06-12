// To parse this JSON data, do
//
//     final getMyWishListResModel = getMyWishListResModelFromJson(jsonString);

import 'dart:convert';

GetMyWishListResModel getMyWishListResModelFromJson(String str) =>
    GetMyWishListResModel.fromJson(json.decode(str));

String getMyWishListResModelToJson(GetMyWishListResModel data) =>
    json.encode(data.toJson());

class GetMyWishListResModel {
  GetMyWishListResModel({
    this.status,
    this.data,
  });

  String? status;
  List<Data>? data = [];

  factory GetMyWishListResModel.fromJson(Map<String, dynamic> json) =>
      GetMyWishListResModel(
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
    this.img,
  });

  String? productId;
  String? product;
  String? price;
  String? mrp;
  String? img;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        productId: json["product_id"],
        product: json["product"],
        price: json["price"],
        mrp: json["mrp"],
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product": product,
        "price": price,
        "mrp": mrp,
        "img": img,
      };
}
