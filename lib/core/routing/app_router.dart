import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_e_commerce_v2/core/di/di.dart';
import 'package:route_e_commerce_v2/core/routing/routes.dart';
import 'package:route_e_commerce_v2/features/auth/presentation/login/login_cubit.dart';
import 'package:route_e_commerce_v2/features/auth/presentation/login/login_view.dart';
import 'package:route_e_commerce_v2/features/auth/presentation/register/register_cubit.dart';
import 'package:route_e_commerce_v2/features/auth/presentation/register/register_view.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/entity/category_entity.dart';
import 'package:route_e_commerce_v2/features/commerce/presentation/navigation_layout/navigation_view.dart';
import 'package:route_e_commerce_v2/features/commerce/presentation/products/products_view.dart';

abstract class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    if (kDebugMode) {
      print('Navigating to: ${settings.name}');
    }

    final uri = Uri.parse(settings.name ?? '/');

    switch (uri.path) {
      case Routes.navigationRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const NavigationView(),
        );
      case Routes.productsRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ProductsView(category: settings.arguments as CategoryEntity,),
        );
      case Routes.loginRoute:
        {
          var cubit = getIt<LoginCubit>();
          return MaterialPageRoute(
            settings: settings,
            builder:
                (context) => BlocProvider.value(
                  value: cubit,
                  child: LoginView(cubit: cubit),
                ),
          );
        }
      case Routes.registerRoute:
        {
          var cubit = getIt<RegisterCubit>();
          return MaterialPageRoute(
            settings: settings,
            builder:
                (context) => BlocProvider.value(
                  value: cubit,
                  child: RegisterView(cubit: cubit),
                ),
          );
        }
      default:
        return MaterialPageRoute(
          settings: settings,
          builder:
              (_) => const Scaffold(
                body: Center(child: Text('404 - Page Not Found')),
              ),
        );
    }
  }
}
