import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    this.result,
    this.message,
    this.loginData,
  });

  String? result,message;
  LoginData? loginData;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
    result: json["result"],
    message: json["message"],
    loginData: json["data"] == null ? null : LoginData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "message": message,
    "data": loginData!.toJson(),
  };
}

class LoginData {
  LoginData({
    this.id,
    this.name,
    this.status,
    this.email,
    this.role,
    this.createdBy,
    this.updatedBy,
    this.createdName,
    this.updatedName,
    this.token,
    this.permission,
  });

  int? id,createdBy,updatedBy;
  String? name,status,email,role,createdName,updatedName,token;
  List<String>? permission;

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
    id: json["id"],
    name: json["name"],
    status: json["status"],
    email: json["email"],
    role: json["role"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    createdName: json["createdName"],
    updatedName: json["updatedName"],
    token: json["token"],
    permission: List<String>.from(json["permission"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "status": status,
    "email": email,
    "role": role,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "createdName": createdName,
    "updatedName": updatedName,
    "token": token,
    "permission": List<dynamic>.from(permission!.map((x) => x)),
  };
}
