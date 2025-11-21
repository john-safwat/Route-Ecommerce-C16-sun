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
import 'package:flutter/material.dart' as _i409;
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
import '../../features/commerce/data/datasource/banners_local_datasource/banners_local_datasource.dart'
    as _i484;
import '../../features/commerce/data/datasource/banners_local_datasource/banners_local_datasource_impl.dart'
    as _i209;
import '../../features/commerce/data/datasource/categories_remote_datasource/categories_remote_datasource.dart'
    as _i292;
import '../../features/commerce/data/datasource/categories_remote_datasource/categories_remote_datasource_impl.dart'
    as _i143;
import '../../features/commerce/data/datasource/products_remote_datasource/product_remote_datasource.dart'
    as _i346;
import '../../features/commerce/data/datasource/products_remote_datasource/product_remote_datasource_impl.dart'
    as _i158;
import '../../features/commerce/data/mappers/home_mapper.dart' as _i488;
import '../../features/commerce/data/mappers/products_mapper.dart' as _i192;
import '../../features/commerce/data/repository/home_repo_impl.dart' as _i405;
import '../../features/commerce/data/repository/products_repo_impl.dart'
    as _i732;
import '../../features/commerce/domain/repository/home_repo.dart' as _i259;
import '../../features/commerce/domain/repository/products_repo.dart' as _i235;
import '../../features/commerce/domain/use_case/get_banners_use_case.dart'
    as _i835;
import '../../features/commerce/domain/use_case/get_categories_use_case.dart'
    as _i879;
import '../../features/commerce/domain/use_case/get_home_data_use_case.dart'
    as _i679;
import '../../features/commerce/domain/use_case/get_products_list_use_case.dart'
    as _i937;
import '../../features/commerce/presentation/navigation_layout/tabs/categories/categories_cubit.dart'
    as _i51;
import '../../features/commerce/presentation/navigation_layout/tabs/home/home_cubit.dart'
    as _i972;
import '../../features/commerce/presentation/products/products_cubit.dart'
    as _i866;
import '../../features/order/data/datasource/orders_datasource.dart' as _i655;
import '../../features/order/data/datasource/orders_datasource_impl.dart'
    as _i27;
import '../../features/order/data/mapper/order_mapper.dart' as _i558;
import '../../features/order/data/repository/orders_repo_impl.dart' as _i836;
import '../../features/order/domain/repository/order_repo.dart' as _i266;
import '../../features/order/presentation/order/orders_cubit.dart' as _i978;
import '../providers/app_config_provider.dart' as _i56;
import 'modules/asset_bundle_module.dart' as _i574;
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
    final assetBundleModule = _$AssetBundleModule();
    gh.factory<_i528.PrettyDioLogger>(() => dioModule.dioLogger());
    gh.factory<_i635.ChuckerDioInterceptor>(
      () => dioModule.provideChuckerInterceptor(),
    );
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPreferencesModule.preferences(),
      preResolve: true,
    );
    gh.factory<_i496.AuthMapper>(() => _i496.AuthMapper());
    gh.factory<_i488.HomeMapper>(() => _i488.HomeMapper());
    gh.factory<_i192.ProductsMapper>(() => _i192.ProductsMapper());
    gh.factory<_i558.OrderMapper>(() => _i558.OrderMapper());
    gh.singleton<_i409.AssetBundle>(() => assetBundleModule.getAssetBundle());
    gh.factory<_i128.AuthLocalDatasource>(
      () => _i750.AuthLocalDatasourceImpl(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i484.BannersLocalDatasource>(
      () => _i209.BannersLocalDatasourceImpl(gh<_i409.AssetBundle>()),
    );
    gh.factory<_i361.Dio>(
      () => dioModule.provideDio(gh<_i460.SharedPreferences>()),
    );
    gh.singleton<_i56.AppConfigProvider>(
      () => _i56.AppConfigProvider(gh<_i460.SharedPreferences>()),
    );
    gh.singleton<_i502.ApiClient>(() => _i502.ApiClient(gh<_i361.Dio>()));
    gh.factory<_i655.OrdersDatasource>(
      () => _i27.OrdersDatasourceImpl(gh<_i502.ApiClient>()),
    );
    gh.factory<_i292.CategoriesRemoteDatasource>(
      () => _i143.CategoriesRemoteDatasourceImpl(gh<_i502.ApiClient>()),
    );
    gh.factory<_i266.OrderRepo>(
      () => _i836.OrdersRepoImpl(
        gh<_i655.OrdersDatasource>(),
        gh<_i558.OrderMapper>(),
      ),
    );
    gh.factory<_i259.HomeRepo>(
      () => _i405.HomeRepoImpl(
        gh<_i484.BannersLocalDatasource>(),
        gh<_i488.HomeMapper>(),
        gh<_i292.CategoriesRemoteDatasource>(),
      ),
    );
    gh.factory<_i835.GetBannersUseCase>(
      () => _i835.GetBannersUseCase(gh<_i259.HomeRepo>()),
    );
    gh.factory<_i879.GetCategoriesUseCase>(
      () => _i879.GetCategoriesUseCase(gh<_i259.HomeRepo>()),
    );
    gh.factory<_i679.GetHomeDataUseCase>(
      () => _i679.GetHomeDataUseCase(
        gh<_i879.GetCategoriesUseCase>(),
        gh<_i835.GetBannersUseCase>(),
      ),
    );
    gh.factory<_i398.AuthRemoteDataSource>(
      () => _i852.AuthRemoteDataSourceImpl(gh<_i502.ApiClient>()),
    );
    gh.factory<_i346.ProductRemoteDatasource>(
      () => _i158.ProductRemoteDatasourceImpl(gh<_i502.ApiClient>()),
    );
    gh.factory<_i51.CategoriesCubit>(
      () => _i51.CategoriesCubit(gh<_i879.GetCategoriesUseCase>()),
    );
    gh.singleton<_i978.OrdersCubit>(
      () => _i978.OrdersCubit(gh<_i266.OrderRepo>()),
    );
    gh.factory<_i235.ProductsRepo>(
      () => _i732.ProductsRepoImpl(
        gh<_i346.ProductRemoteDatasource>(),
        gh<_i192.ProductsMapper>(),
      ),
    );
    gh.factory<_i972.HomeCubit>(
      () => _i972.HomeCubit(gh<_i679.GetHomeDataUseCase>()),
    );
    gh.factory<_i976.AuthRepo>(
      () => _i751.AuthRepoImpl(
        gh<_i398.AuthRemoteDataSource>(),
        gh<_i128.AuthLocalDatasource>(),
      ),
    );
    gh.factory<_i937.GetProductsListUseCase>(
      () => _i937.GetProductsListUseCase(gh<_i235.ProductsRepo>()),
    );
    gh.factory<_i866.ProductsCubit>(
      () => _i866.ProductsCubit(gh<_i937.GetProductsListUseCase>()),
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

class _$AssetBundleModule extends _i574.AssetBundleModule {}
