import 'package:route_e_commerce_v2/core/network/api_results.dart';

abstract interface class AuthRepo {
  Future<ApiResults<String>> signup(
    String name,
    String email,
    String phone,
    String password,
    String rePassword,
  );
}
