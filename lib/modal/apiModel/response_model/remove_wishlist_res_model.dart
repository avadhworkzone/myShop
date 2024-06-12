class RemoveWishlistResModel {
  String? status;
  String? msg;

  RemoveWishlistResModel({this.status, this.msg});

  RemoveWishlistResModel.fromJson(Map<String, dynamic> json) {
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
