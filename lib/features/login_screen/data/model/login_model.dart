class LoginModel {
  bool? success;
  int? code;
  String? message;
  String? token;
  DataLoginModel? data;
  LoginModel({this.code, this.data, this.message, this.success, this.token});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      code: json['code'],
      data: DataLoginModel.fromJson(json['data']),
      message: json['message'],
      success: json['success'],
      token: json['token'],
    );
  }
}

class DataLoginModel {
  String? name;
  String? email;
  String? phone;
  int? age;
  int? id;
  DataLoginModel(this.age, this.email, this.id, this.name, this.phone);
  factory DataLoginModel.fromJson(Map<String, dynamic> json) {
    return DataLoginModel(
      json['age'],
      json['email'],
      json['id'],
      json['name'],
      json['phone'],
    );
  }
}
/*
{
  "success": true,
  "code": 201,
  "message": "Account created successfully",
  "data": {
    "name": "Ahmed Mohamed",
    "email": "ahmed@example.com",
    "phone": "01012345678",
    "age": 25,
    "updated_at": "2026-11-27 17:48:02",
    "created_at": "2026-11-27 17:48:02",
    "id": 10
  }
}
 */
