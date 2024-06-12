// class GetCategoryListResModel {
//   List<DATA>? dATA;
//   String? status;
//
//   GetCategoryListResModel({this.dATA, this.status});
//
//   GetCategoryListResModel.fromJson(Map<String, dynamic> json) {
//     if (json['DATA'] != null) {
//       dATA = <DATA>[];
//       json['DATA'].forEach((v) {
//         dATA!.add(new DATA.fromJson(v));
//       });
//     }
//     status = json['status'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.dATA != null) {
//       data['DATA'] = this.dATA!.map((v) => v.toJson()).toList();
//     }
//     data['status'] = this.status;
//     return data;
//   }
// }
//
// class DATA {
//   String? id;
//   String? name;
//   String? descriptions;
//   String? image;
//
//   DATA({this.id, this.name, this.descriptions, this.image});
//
//   DATA.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     descriptions = json['descriptions'];
//     image = json['image'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['descriptions'] = this.descriptions;
//     data['image'] = this.image;
//     return data;
//   }
// }
class GetCategoryListResModel {
  String? status;
  List<Data>? data;

  GetCategoryListResModel({this.status, this.data});

  GetCategoryListResModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? descriptions;
  String? image;

  Data({this.id, this.name, this.descriptions, this.image});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    descriptions = json['descriptions'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['descriptions'] = this.descriptions;
    data['image'] = this.image;
    return data;
  }
}
