import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:route_e_commerce_v2/core/network/api_results.dart';
import 'package:route_e_commerce_v2/core/network/app_errors.dart';

Future<ApiResults<T>> safeCall<T>(Future<ApiResults<T>> Function() call) async {
  try {
    return call();
  } on DioException catch (e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return Fail(exception: TimeOutError());
      case DioExceptionType.badCertificate:
      case DioExceptionType.badResponse:
        return Fail(exception: BadResponse());
      case DioExceptionType.cancel:
      case DioExceptionType.connectionError:
      case DioExceptionType.unknown:
        return Fail(exception: ConnectionError());
    }
  } on TimeoutException {
    return Fail(exception: TimeOutError());
  } on IOException {
    return Fail(exception: ConnectionError());
  } catch (e) {
    return Fail<T>(exception: e as Exception);
  }
}
