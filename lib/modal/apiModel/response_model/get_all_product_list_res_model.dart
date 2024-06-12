// import 'dart:convert';
//
// GetAllProductListResModel getAllProductListResModelFromJson(String str) =>
//     GetAllProductListResModel.fromJson(json.decode(str));
//
// String getAllProductListResModelToJson(GetAllProductListResModel data) =>
//     json.encode(data.toJson());
//
// class GetAllProductListResModel {
//   GetAllProductListResModel({
//     this.status,
//     this.data,
//   });
//
//   String? status;
//   List<Data>? data;
//
//   factory GetAllProductListResModel.fromJson(Map<String, dynamic> json) =>
//       GetAllProductListResModel(
//         status: json["status"],
//         data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "data": List<dynamic>.from(data!.map((x) => x.toJson())),
//       };
// }
//
// class Data {
//   Data({
//     this.id,
//     this.categoryId,
//     this.productCode,
//     this.categoryName,
//     this.product,
//     this.price,
//     this.stock,
//     this.mrp,
//     this.specification,
//     this.addDate,
//     this.descriptions,
//     this.coupon,
//     this.displayin,
//     this.img1,
//     this.wishlist,
//     this.galleryImgs,
//     this.galleryVideos,
//   });
//
//   String? id;
//   String? categoryId;
//   String? productCode;
//   CategoryName? categoryName;
//   String? product;
//   String? price;
//   String? stock;
//   String? mrp;
//   String? specification;
//   AddDate? addDate;
//   String? descriptions;
//   String? coupon;
//   String? displayin;
//   String? img1;
//   String? wishlist;
//   List<String>? galleryImgs;
//   List<String>? galleryVideos;
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         id: json["id"],
//         categoryId: json["category_id"],
//         productCode: json["product_code"],
//         categoryName: categoryNameValues.map![json["category_name"]],
//         product: json["product"],
//         price: json["price"],
//         stock: json["stock"],
//         mrp: json["mrp"],
//         specification: json["specification"],
//         addDate: addDateValues.map![json["add_date"]],
//         descriptions: json["descriptions"],
//         coupon: json["coupon"],
//         displayin: json["displayin"],
//         img1: json["img1"],
//         wishlist: json["wishlist"],
//         galleryImgs: List<String>.from(json["gallery_imgs"].map((x) => x)),
//         galleryVideos: List<String>.from(json["gallery_videos"].map((x) => x)),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "category_id": categoryId,
//         "product_code": productCode,
//         "category_name": categoryNameValues.reverse[categoryName],
//         "product": product,
//         "price": price,
//         "stock": stock,
//         "mrp": mrp,
//         "specification": specification,
//         "add_date": addDateValues.reverse[addDate],
//         "descriptions": descriptions,
//         "coupon": coupon,
//         "displayin": displayin,
//         "img1": img1,
//         "wishlist": wishlist,
//         "gallery_imgs": List<dynamic>.from(galleryImgs!.map((x) => x)),
//         "gallery_videos": List<dynamic>.from(galleryVideos!.map((x) => x)),
//       };
// }
//
// enum AddDate { THE_00000000 }
//
// final addDateValues = EnumValues({"0000-00-00": AddDate.THE_00000000});
//
// enum CategoryName { APPLIANCES, FRUITS, VEGETABLES, H_ILLY_VEGETABLES, OTHERS }
//
// final categoryNameValues = EnumValues({
//   "Appliances": CategoryName.APPLIANCES,
//   "Fruits": CategoryName.FRUITS,
//   "HIlly Vegetables": CategoryName.H_ILLY_VEGETABLES,
//   "Others": CategoryName.OTHERS,
//   "Vegetables": CategoryName.VEGETABLES
// });
//
// class EnumValues<T> {
//   Map<String, T>? map;
//   Map<T, String>? reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map!.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap!;
//   }
// }
// To parse this JSON data, do
//
//     final getAllProductListResModel = getAllProductListResModelFromJson(jsonString);
///new
// class GetAllProductListResModel {
//   String? status;
//   List<Data>? data;
//
//   GetAllProductListResModel({this.status, this.data});
//
//   GetAllProductListResModel.fromJson(Map<String, dynamic> json) {
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
//   String? id;
//   String? categoryId;
//   String? productCode;
//   String? categoryName;
//   String? product;
//   String? price;
//   String? stock;
//   String? mrp;
//   String? specification;
//   String? addDate;
//   String? descriptions;
//   String? coupon;
//   String? displayin;
//   String? img1;
//   String? wishlist;
//   List<String>? galleryImgs;
//   List<String>? galleryVideos;
//
//   Data(
//       {this.id,
//       this.categoryId,
//       this.productCode,
//       this.categoryName,
//       this.product,
//       this.price,
//       this.stock,
//       this.mrp,
//       this.specification,
//       this.addDate,
//       this.descriptions,
//       this.coupon,
//       this.displayin,
//       this.img1,
//       this.wishlist,
//       this.galleryImgs,
//       this.galleryVideos});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     categoryId = json['category_id'];
//     productCode = json['product_code'];
//     categoryName = json['category_name'];
//     product = json['product'];
//     price = json['price'];
//     stock = json['stock'];
//     mrp = json['mrp'];
//     specification = json['specification'];
//     addDate = json['add_date'];
//     descriptions = json['descriptions'];
//     coupon = json['coupon'];
//     displayin = json['displayin'];
//     img1 = json['img1'];
//     wishlist = json['wishlist'];
//     galleryImgs = json['gallery_imgs'].cast<String>();
//     galleryVideos = json['gallery_videos'].cast<String>();
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['category_id'] = this.categoryId;
//     data['product_code'] = this.productCode;
//     data['category_name'] = this.categoryName;
//     data['product'] = this.product;
//     data['price'] = this.price;
//     data['stock'] = this.stock;
//     data['mrp'] = this.mrp;
//     data['specification'] = this.specification;
//     data['add_date'] = this.addDate;
//     data['descriptions'] = this.descriptions;
//     data['coupon'] = this.coupon;
//     data['displayin'] = this.displayin;
//     data['img1'] = this.img1;
//     data['wishlist'] = this.wishlist;
//     data['gallery_imgs'] = this.galleryImgs;
//     data['gallery_videos'] = this.galleryVideos;
//     return data;
//   }
// }

///new 1
// class GetAllProductListResModel {
//   String? status;
//   List<Data>? data;
//
//   GetAllProductListResModel({this.status, this.data});
//
//   GetAllProductListResModel.fromJson(Map<String, dynamic> json) {
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
//   String? id;
//   String? categoryId;
//   String? productCode;
//   String? categoryName;
//   String? product;
//   String? price;
//   String? stock;
//   String? mrp;
//   String? specification;
//   String? addDate;
//   String? descriptions;
//   String? coupon;
//   String? displayin;
//   String? img1;
//   String? wishlist;
//   List<String>? galleryImgs;
//   List<String>? galleryVideos;
//
//   Data(
//       {this.id,
//       this.categoryId,
//       this.productCode,
//       this.categoryName,
//       this.product,
//       this.price,
//       this.stock,
//       this.mrp,
//       this.specification,
//       this.addDate,
//       this.descriptions,
//       this.coupon,
//       this.displayin,
//       this.img1,
//       this.wishlist,
//       this.galleryImgs,
//       this.galleryVideos});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     categoryId = json['category_id'];
//     productCode = json['product_code'];
//     categoryName = json['category_name'];
//     product = json['product'];
//     price = json['price'];
//     stock = json['stock'];
//     mrp = json['mrp'];
//     specification = json['specification'];
//     addDate = json['add_date'];
//     descriptions = json['descriptions'];
//     coupon = json['coupon'];
//     displayin = json['displayin'];
//     img1 = json['img1'];
//     wishlist = json['wishlist'];
//     galleryImgs = json['gallery_imgs'].cast<String>();
//     galleryVideos = json['gallery_videos'].cast<String>();
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['category_id'] = this.categoryId;
//     data['product_code'] = this.productCode;
//     data['category_name'] = this.categoryName;
//     data['product'] = this.product;
//     data['price'] = this.price;
//     data['stock'] = this.stock;
//     data['mrp'] = this.mrp;
//     data['specification'] = this.specification;
//     data['add_date'] = this.addDate;
//     data['descriptions'] = this.descriptions;
//     data['coupon'] = this.coupon;
//     data['displayin'] = this.displayin;
//     data['img1'] = this.img1;
//     data['wishlist'] = this.wishlist;
//     data['gallery_imgs'] = this.galleryImgs;
//     data['gallery_videos'] = this.galleryVideos;
//     return data;
//   }
// }

///
// To parse this JSON data, do
//
//     final getAllProductListResModel = getAllProductListResModelFromJson(jsonString);

class GetAllProductListResModel {
  String? status;
  List<Data>? data;

  GetAllProductListResModel({this.status, this.data});

  GetAllProductListResModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
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

  Data(
      {this.id,
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
      this.galleryVideos});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    productCode = json['product_code'];
    categoryName = json['category_name'];
    product = json['product'];
    price = json['price'];
    stock = json['stock'];
    mrp = json['mrp'];
    specification = json['specification'];
    addDate = json['add_date'];
    descriptions = json['descriptions'];
    coupon = json['coupon'];
    displayin = json['displayin'];
    img1 = json['img1'];
    wishlist = json['wishlist'];
    galleryImgs = json['gallery_imgs'].cast<String>();
    galleryVideos = json['gallery_videos'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['product_code'] = this.productCode;
    data['category_name'] = this.categoryName;
    data['product'] = this.product;
    data['price'] = this.price;
    data['stock'] = this.stock;
    data['mrp'] = this.mrp;
    data['specification'] = this.specification;
    data['add_date'] = this.addDate;
    data['descriptions'] = this.descriptions;
    data['coupon'] = this.coupon;
    data['displayin'] = this.displayin;
    data['img1'] = this.img1;
    data['wishlist'] = this.wishlist;
    data['gallery_imgs'] = this.galleryImgs;
    data['gallery_videos'] = this.galleryVideos;
    return data;
  }
}
