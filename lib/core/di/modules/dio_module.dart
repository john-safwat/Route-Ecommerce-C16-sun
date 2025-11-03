import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../di.dart';

@module
abstract class DioModule {
  @factoryMethod
  Dio provideDio(SharedPreferences pref) {
    Dio dio = Dio();

    var token = pref.getString("token");

    dio.options = BaseOptions(
      connectTimeout: const Duration(seconds: 180),
      receiveTimeout: const Duration(seconds: 180),
      baseUrl: "https://ecommerce.routemisr.com",
      validateStatus: (_) {
        return true;
      },
    );

    if (token != null) {
      dio.options.headers = {"Authorization": "Bearer $token"};
    }

    dio.interceptors.add(getIt<PrettyDioLogger>());
    dio.interceptors.add(getIt<ChuckerDioInterceptor>());

    return dio;
  }

  @factoryMethod
  PrettyDioLogger dioLogger() {
    return PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 140,
    );
  }

  ChuckerDioInterceptor provideChuckerInterceptor() {
    return ChuckerDioInterceptor();
  }
}
