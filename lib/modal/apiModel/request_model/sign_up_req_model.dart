// class SignUpReqModel {
//   String? action;
//   String? name;
//   String? email;
//   String? password;
//
//   SignUpReqModel({this.action, this.name, this.email, this.password});
//
//   SignUpReqModel.fromJson(Map<String, dynamic> json) {
//     action = json['action'];
//     name = json['name'];
//     email = json['email'];
//     password = json['password'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['action'] = this.action ?? "signup";
//     data['name'] = this.name;
//     data['email'] = this.email;
//     data['password'] = this.password;
//     return data;
//   }
// }

class SignUpReqModel {
  String? action;
  String? name;
  String? email;
  String? mobileNo;
  String? password;

  SignUpReqModel(
      {this.action, this.name, this.email, this.mobileNo, this.password});

  SignUpReqModel.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    name = json['name'];
    email = json['email'];
    mobileNo = json['mobile_no'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action'] = this.action ?? "signup";
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile_no'] = this.mobileNo;
    data['password'] = this.password;
    return data;
  }
}
