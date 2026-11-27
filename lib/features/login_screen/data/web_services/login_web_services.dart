import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:first_project/core/api/end_points.dart';

class LoginWebServices {
  //! SERVER > LOGIN>
  late Dio dio;
  LoginWebServices() {
    BaseOptions? options = BaseOptions(
      baseUrl: EndPoints.baseUrl,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
    );
    dio = Dio(options);
  }
  Future<dynamic> login({
    required String email,
    required String password,
  }) async {
    final response = await dio.post(
      '/login',
      data: {'email': email, "password": password},
    );
    log('LOG FROM WEBSERVICE : ${response.data}');

    return response.data;
  }
}
