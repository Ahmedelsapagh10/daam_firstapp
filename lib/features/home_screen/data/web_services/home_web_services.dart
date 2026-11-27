import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:first_project/core/api/end_points.dart';
import 'package:first_project/core/constant/constants.dart';

class HomeWebServices {
  //! SERVER > LOGIN>
  late Dio dio;
  HomeWebServices() {
    BaseOptions? options = BaseOptions(
      baseUrl: EndPoints.baseNewsUrl,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
    );
    dio = Dio(options);
  }
  Future<dynamic> getNews() async {
    final response = await dio.get(
      '/latest',
      queryParameters: {
        'apikey': Constants.apiKey,
        "country": 'eg',
        'language': 'ar',
      },
    );

    log('DAATA : ${response.data}');
    return response.data;
  }
}
