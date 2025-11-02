import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../di.dart';

@module
abstract class DioModule {
  @factoryMethod
  Dio provideDio() {
    Dio dio = Dio();

    dio.options = BaseOptions(
      connectTimeout: const Duration(seconds: 180),
      receiveTimeout:const Duration(seconds: 180),
      baseUrl: "https://ecommerce.routemisr.com",
    );

    dio.interceptors.add(getIt<PrettyDioLogger>());
    dio.interceptors.add(getIt<ChuckerDioInterceptor>());

    return dio;
  }


  @factoryMethod
  PrettyDioLogger dioLogger(){
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
