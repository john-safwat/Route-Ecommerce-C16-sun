// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:chucker_flutter/chucker_flutter.dart' as _i635;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../api/api_client.dart' as _i502;
import '../../features/auth/data/datasource/local_datasource/auth_local_datasource.dart'
    as _i128;
import '../../features/auth/data/datasource/local_datasource/auth_local_datasource_impl.dart'
    as _i750;
import '../../features/auth/data/datasource/remote_datasource/auth_remote_data_source.dart'
    as _i398;
import '../../features/auth/data/datasource/remote_datasource/auth_remote_data_source_impl.dart'
    as _i852;
import '../../features/auth/data/mapper/auth_mapper.dart' as _i496;
import '../../features/auth/data/repository/auth_repo_impl.dart' as _i751;
import '../../features/auth/domain/repository/auth_repo.dart' as _i976;
import '../../features/auth/domain/use_cases/signin_use_case.dart' as _i633;
import '../../features/auth/domain/use_cases/signup_use_case.dart' as _i571;
import '../../features/auth/presentation/login/login_cubit.dart' as _i644;
import '../../features/auth/presentation/register/register_cubit.dart' as _i837;
import '../providers/app_config_provider.dart' as _i56;
import 'modules/dio_module.dart' as _i983;
import 'modules/shared_preferences_module.dart' as _i813;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    final sharedPreferencesModule = _$SharedPreferencesModule();
    gh.factory<_i361.Dio>(() => dioModule.provideDio());
    gh.factory<_i528.PrettyDioLogger>(() => dioModule.dioLogger());
    gh.factory<_i635.ChuckerDioInterceptor>(
      () => dioModule.provideChuckerInterceptor(),
    );
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPreferencesModule.preferences(),
      preResolve: true,
    );
    gh.factory<_i496.AuthMapper>(() => _i496.AuthMapper());
    gh.factory<_i128.AuthLocalDatasource>(
      () => _i750.AuthLocalDatasourceImpl(gh<_i460.SharedPreferences>()),
    );
    gh.singleton<_i502.ApiClient>(() => _i502.ApiClient(gh<_i361.Dio>()));
    gh.singleton<_i56.AppConfigProvider>(
      () => _i56.AppConfigProvider(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i398.AuthRemoteDataSource>(
      () => _i852.AuthRemoteDataSourceImpl(gh<_i502.ApiClient>()),
    );
    gh.factory<_i976.AuthRepo>(
      () => _i751.AuthRepoImpl(
        gh<_i398.AuthRemoteDataSource>(),
        gh<_i128.AuthLocalDatasource>(),
      ),
    );
    gh.factory<_i571.SignupUseCase>(
      () => _i571.SignupUseCase(gh<_i976.AuthRepo>()),
    );
    gh.factory<_i633.SignInUseCase>(
      () => _i633.SignInUseCase(gh<_i976.AuthRepo>()),
    );
    gh.factory<_i644.LoginCubit>(
      () => _i644.LoginCubit(gh<_i633.SignInUseCase>()),
    );
    gh.factory<_i837.RegisterCubit>(
      () => _i837.RegisterCubit(gh<_i571.SignupUseCase>()),
    );
    return this;
  }
}

class _$DioModule extends _i983.DioModule {}

class _$SharedPreferencesModule extends _i813.SharedPreferencesModule {}
