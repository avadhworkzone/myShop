class addWishListMultipleDataResModel {
  String? status;
  String? msg;

  addWishListMultipleDataResModel({this.status, this.msg});

  addWishListMultipleDataResModel.fromJson(Map<String, dynamic> json) {
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
