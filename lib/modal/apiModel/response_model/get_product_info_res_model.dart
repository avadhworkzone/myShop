import 'dart:convert';

GetProductInfoResModel getProductInfoResModelFromJson(String str) =>
    GetProductInfoResModel.fromJson(json.decode(str));

String getProductInfoResModelToJson(GetProductInfoResModel data) =>
    json.encode(data.toJson());

class GetProductInfoResModel {
  GetProductInfoResModel({
    this.status,
    this.data,
  });

  String? status;
  List<Data>? data = [];

  factory GetProductInfoResModel.fromJson(Map<String, dynamic> json) =>
      GetProductInfoResModel(
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
    this.discount,
    this.discountPer,
    this.galleryImgs,
    this.galleryVideos,
    this.avgRating,
    this.reviewInfo,
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
  String? discount;
  String? discountPer;
  List<String>? galleryImgs;
  List<String>? galleryVideos;
  double? avgRating;
  List<ReviewInfo>? reviewInfo;

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
        discount: json["discount"],
        discountPer: json["discount_per"],
        galleryImgs: List<String>.from(json["gallery_imgs"].map((x) => x)),
        galleryVideos: List<String>.from(json["gallery_videos"].map((x) => x)),
        avgRating: json["avg_rating"].toDouble(),
        reviewInfo: List<ReviewInfo>.from(
            json["review_info"].map((x) => ReviewInfo.fromJson(x))),
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
        "discount": discount,
        "discount_per": discountPer,
        "gallery_imgs": List<dynamic>.from(galleryImgs!.map((x) => x)),
        "gallery_videos": List<dynamic>.from(galleryVideos!.map((x) => x)),
        "avg_rating": avgRating,
        "review_info": List<dynamic>.from(reviewInfo!.map((x) => x.toJson())),
      };
}

class ReviewInfo {
  ReviewInfo({
    this.productId,
    this.userId,
    this.content,
    this.rating,
    this.submitDate,
    this.name,
  });

  String? productId;
  String? userId;
  String? content;
  String? rating;
  DateTime? submitDate;
  String? name;

  factory ReviewInfo.fromJson(Map<String, dynamic> json) => ReviewInfo(
        productId: json["product_id"],
        userId: json["user_id"],
        content: json["content"],
        rating: json["rating"],
        submitDate: DateTime.parse(json["submit_date"]),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "user_id": userId,
        "content": content,
        "rating": rating,
        "submit_date": submitDate!.toIso8601String(),
        "name": name,
      };
}
