class GetShopInfoReqModel {
  String? action;

  GetShopInfoReqModel({this.action});

  GetShopInfoReqModel.fromJson(Map<String, dynamic> json) {
    action = json['action'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action'] = this.action ?? "getShopInfo";
    return data;
  }
}
