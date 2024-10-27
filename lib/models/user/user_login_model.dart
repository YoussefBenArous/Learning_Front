class UserModel {
  String? msg;
  User? user;

  UserModel({this.msg, this.user});

  UserModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? sId;
  String? name;
  String? email;
  String? password;
  String? confirmpassword;
  String? role;
  int? iV;

  User(
      {this.sId,
      this.name,
      this.email,
      this.password,
      this.confirmpassword,
      this.role,
      this.iV});

  User.fromJson(Map<String, dynamic> json) {
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