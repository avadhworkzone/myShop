class GetShopInfoResModel {
  String? status;
  List<Data>? data;

  GetShopInfoResModel({this.status, this.data});

  GetShopInfoResModel.fromJson(Map<String, dynamic> json) {
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
  String? shopName;
  String? shopLogo;
  String? currency;
  List<String>? bannerImgs;

  Data({this.shopName, this.shopLogo, this.currency, this.bannerImgs});

  Data.fromJson(Map<String, dynamic> json) {
    shopName = json['shop_name'];
    shopLogo = json['shop_logo'];
    currency = json['currency'];
    bannerImgs = json['banner_imgs'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shop_name'] = this.shopName;
    data['shop_logo'] = this.shopLogo;
    data['currency'] = this.currency;
    data['banner_imgs'] = this.bannerImgs;
    return data;
  }
}
