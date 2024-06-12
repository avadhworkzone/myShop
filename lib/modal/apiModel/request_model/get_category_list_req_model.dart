class GetCategoryListReqModel {
  String? action;

  GetCategoryListReqModel({this.action});

  GetCategoryListReqModel.fromJson(Map<String, dynamic> json) {
    action = json['action'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action'] = this.action ?? "getCategoryList";
    return data;
  }
}
