import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_e_commerce_v2/core/network/Resources.dart';
import 'package:route_e_commerce_v2/core/routing/routes.dart';
import 'package:route_e_commerce_v2/core/theme/app_colors.dart';
import 'package:route_e_commerce_v2/core/utils/validation.dart';
import 'package:route_e_commerce_v2/core/utils/white_space.dart';
import 'package:route_e_commerce_v2/features/auth/presentation/login/login_cubit.dart';
import 'package:route_e_commerce_v2/features/auth/presentation/login/login_states.dart';

class LoginView extends StatefulWidget {
  final LoginCubit cubit;

  const LoginView({required this.cubit, super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool visible = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    widget.cubit.navigationStream.listen((navigationEvent) {
      switch (navigationEvent) {
        case NavigateToRegister():
          {
            Navigator.pushReplacementNamed(context, Routes.registerRoute);
          }
        case NavigateToHome():
          {
            // todo add navigation to home screen
          }
        case ShowErrorMessage():
          {
            showDialog(
              context: context,
              builder:
                  (context) => AlertDialog(
                    title: const Text("Error"),
                    content: Text(navigationEvent.message),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("ok"),
                      ),
                    ],
                  ),
            );
          }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            SafeArea(child: Image.asset("assets/images/route_login_logo.png")),
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
              "Email",
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(color: AppColors.white),
            ),
            8.spaceVertical,
            TextFormField(
              controller: emailController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) => Validation.validateEmail(value),
              decoration: const InputDecoration(hintText: "enter your email"),
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
              controller: passwordController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) => Validation.validatePassword(value),
              obscureText: !visible,
              decoration: InputDecoration(
                hintText: "enter your Password",
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      visible = !visible;
                    });
                  },
                  child: Icon(
                    visible ? Icons.visibility : Icons.visibility_off,
                    color: AppColors.grey,
                  ),
                ),
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
            BlocBuilder<LoginCubit, LoginStates>(
              builder:
                  (context, state) => ElevatedButton(
                    onPressed: () {
                      if (state.loginResource.status == Status.loading) return;
                      if (formKey.currentState!.validate()) {
                        widget.cubit.doAction(
                          Login(emailController.text, passwordController.text),
                        );
                      }
                    },
                    child: state.loginResource.status == Status.loading? CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.primary,
                    ): Text("Login"),
                  ),
            ),
            16.spaceVertical,
            TextButton(
              onPressed: () {
                widget.cubit.doAction(NavigateToRegisterScreenEvent());
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
