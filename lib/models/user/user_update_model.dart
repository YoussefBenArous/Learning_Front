class UserModelBYid {
  String? msg;
  Data? data;

  UserModelBYid({this.msg, this.data});

  UserModelBYid.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? name;
  String? email;
  String? password;
  String? confirmpassword;
  String? role;
  int? iV;

  Data(
      {this.sId,
      this.name,
      this.email,
      this.password,
      this.confirmpassword,
      this.role,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    confirmpassword = json['confirmpassword'];
    role = json['role'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['confirmpassword'] = this.confirmpassword;
    data['role'] = this.role;
    data['__v'] = this.iV;
    return data;
  }
}