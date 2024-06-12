// To parse this JSON data, do
//
//     final getProductListResModel = getProductListResModelFromJson(jsonString);

import 'dart:convert';

GetProductListResModel getProductListResModelFromJson(String str) =>
    GetProductListResModel.fromJson(json.decode(str));

String getProductListResModelToJson(GetProductListResModel data) =>
    json.encode(data.toJson());

class GetProductListResModel {
  GetProductListResModel({
    this.status,
    this.data,
  });

  String? status;
  List<Data>? data = [];

  factory GetProductListResModel.fromJson(Map<String, dynamic> json) =>
      GetProductListResModel(
        status: json["status"],
        data: json["status"] == "OK"
            ? List<Data>.from(json["data"].map((x) => Data.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Data {
  Data({
    this.id,
    this.categoryId,
    this.productCode,
    this.categoryName,
    this.product,
    this.price,
    this.stock,
    this.mrp,
    this.specification,
    this.addDate,
    this.descriptions,
    this.coupon,
    this.displayin,
    this.img1,
    this.wishlist,
    this.galleryImgs,
    this.galleryVideos,
  });

  String? id;
  String? categoryId;
  String? productCode;
  String? categoryName;
  String? product;
  String? price;
  String? stock;
  String? mrp;
  String? specification;
  String? addDate;
  String? descriptions;
  String? coupon;
  String? displayin;
  String? img1;
  String? wishlist;
  List<String>? galleryImgs;
  List<String>? galleryVideos;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        categoryId: json["category_id"],
        productCode: json["product_code"],
        categoryName: json["category_name"],
        product: json["product"],
        price: json["price"],
        stock: json["stock"],
        mrp: json["mrp"],
        specification: json["specification"],
        addDate: json["add_date"],
        descriptions: json["descriptions"],
        coupon: json["coupon"],
        displayin: json["displayin"],
        img1: json["img1"],
        wishlist: json["wishlist"],
        galleryImgs: List<String>.from(json["gallery_imgs"].map((x) => x)),
        galleryVideos: List<String>.from(json["gallery_videos"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "product_code": productCode,
        "category_name": categoryName,
        "product": product,
        "price": price,
        "stock": stock,
        "mrp": mrp,
        "specification": specification,
        "add_date": addDate,
        "descriptions": descriptions,
        "coupon": coupon,
        "displayin": displayin,
        "img1": img1,
        "wishlist": wishlist,
        "gallery_imgs": List<dynamic>.from(galleryImgs!.map((x) => x)),
        "gallery_videos": List<dynamic>.from(galleryVideos!.map((x) => x)),
      };
}
