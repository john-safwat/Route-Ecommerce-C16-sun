import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_e_commerce_v2/core/routing/routes.dart';
import 'package:route_e_commerce_v2/core/theme/app_colors.dart';
import 'package:route_e_commerce_v2/core/utils/white_space.dart';
import 'package:route_e_commerce_v2/features/auth/presentation/login/login_cubit.dart';
import 'package:route_e_commerce_v2/features/auth/presentation/login/login_states.dart';

class LoginView extends StatelessWidget {
  final LoginCubit cubit;

  const LoginView({required this.cubit, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state.navigateToRegister) {
          Navigator.pushReplacementNamed(context, Routes.registerRoute);
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            SafeArea(
              child: Image.asset("assets/images/route_login_logo.png"),
            ),
            16.spaceVertical,
            Text(
              "Welcome Back To Route",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: AppColors.white,
                fontSize: 24,
              ),
            ),
            8.spaceVertical,
            Text(
              "Please sign in with your mail",
              style: Theme.of(
                context,
              ).textTheme.labelLarge!.copyWith(color: AppColors.white),
            ),
            24.spaceVertical,
            Text(
              "UserName",
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(color: AppColors.white),
            ),
            8.spaceVertical,
            TextFormField(
              decoration: const InputDecoration(hintText: "enter your name"),
            ),
            24.spaceVertical,
            Text(
              "Password",
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(color: AppColors.white),
            ),
            8.spaceVertical,
            TextFormField(
              decoration: const InputDecoration(
                hintText: "enter your Password",
                suffixIcon: Icon(Icons.visibility, color: AppColors.grey),
              ),
            ),
            8.spaceVertical,
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // todo navigate to forget password screen
                },
                child: const Text(
                  'Forget Password',
                  style: TextStyle(color: AppColors.white),
                ),
              ),
            ),
            8.spaceVertical,
            ElevatedButton(
              onPressed: () {
                // todo login user
              },
              child: const Text("Login"),
            ),
            16.spaceVertical,
            TextButton(
              onPressed: () {
                cubit.doIntent(NavigateToRegisterScreenEvent());
              },
              child: const Text(
                'Don’t have an account? Create Account',
                style: TextStyle(color: AppColors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
