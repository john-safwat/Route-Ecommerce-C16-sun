import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/features/auth/data/datasource/local_datasource/auth_local_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: AuthLocalDatasource)
class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  SharedPreferences preferences;

  AuthLocalDatasourceImpl(this.preferences);

  @override
  Future<void> saveToken(String token) async {
    await preferences.setString("token", token);
  }
}
