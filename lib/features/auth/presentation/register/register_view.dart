import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_e_commerce_v2/core/network/Resources.dart';
import 'package:route_e_commerce_v2/core/routing/routes.dart';
import 'package:route_e_commerce_v2/core/theme/app_colors.dart';
import 'package:route_e_commerce_v2/core/utils/validation.dart';
import 'package:route_e_commerce_v2/core/utils/white_space.dart';
import 'package:route_e_commerce_v2/features/auth/presentation/register/register_cubit.dart';
import 'package:route_e_commerce_v2/features/auth/presentation/register/register_state.dart';

class RegisterView extends StatefulWidget {
  final RegisterCubit cubit;

  RegisterView({required this.cubit, super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController rePasswordController = TextEditingController();


  @override
  void initState() {
    super.initState();
    widget.cubit.navigationStream.listen((navigationEvent){
      switch (navigationEvent) {
        case NavigateToLogin():{
          Navigator.pushReplacementNamed(context, Routes.loginRoute);
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state.registerResources.status == Status.error) {
          showDialog(
            context: context,
            builder:
                (context) => AlertDialog(
                  title: const Text("Error"),
                  content: Text(state.registerResources.exception.toString()),
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
      },
      builder:
          (context, state) => Scaffold(
            backgroundColor: Theme.of(context).colorScheme.primary,
            body: Form(
              key: formKey,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  SafeArea(
                    child: Image.asset("assets/images/route_login_logo.png"),
                  ),
                  Text(
                    "UserName",
                    style: Theme.of(
                      context,
                    ).textTheme.titleLarge!.copyWith(color: AppColors.white),
                  ),
                  8.spaceVertical,
                  TextFormField(
                    controller: nameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => Validation.validateName(value),
                    decoration: const InputDecoration(
                      hintText: "enter your name",
                    ),
                  ),
                  16.spaceVertical,
                  Text(
                    "Phone",
                    style: Theme.of(
                      context,
                    ).textTheme.titleLarge!.copyWith(color: AppColors.white),
                  ),
                  8.spaceVertical,
                  TextFormField(
                    controller: phoneController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator:
                        (value) =>
                            Validation.validateEgyptianPhoneNumber(value),
                    decoration: const InputDecoration(
                      hintText: "enter your number",
                    ),
                  ),
                  16.spaceVertical,
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
                    decoration: const InputDecoration(
                      hintText: "enter your email",
                    ),
                  ),
                  16.spaceVertical,
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
                    obscureText: !state.passwordVisible,
                    decoration: InputDecoration(
                      hintText: "enter your Password",
                      suffixIcon: InkWell(
                        onTap: () {
                          widget.cubit.doAction(ChangePasswordVisibilityEvent());
                        },
                        child: Icon(
                          state.passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColors.grey,
                        ),
                      ),
                    ),
                  ),
                  16.spaceVertical,
                  Text(
                    "Password Confirmation",
                    style: Theme.of(
                      context,
                    ).textTheme.titleLarge!.copyWith(color: AppColors.white),
                  ),
                  8.spaceVertical,
                  TextFormField(
                    controller: rePasswordController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator:
                        (value) => Validation.validatePasswordConfirmation(
                          confirmationValue: value,
                          originalPasswordValue: passwordController.text,
                        ),
                    obscureText: !state.rePasswordVisible,
                    decoration: InputDecoration(
                      hintText: "enter your Password",
                      suffixIcon: InkWell(
                        onTap: () {
                          widget.cubit.doAction(ChangeRePasswordVisibilityEvent());
                        },
                        child: Icon(
                          state.rePasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColors.grey,
                        ),
                      ),
                    ),
                  ),

                  24.spaceVertical,
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        widget.cubit.doAction(
                          SignUpEvent(
                            nameController.text,
                            emailController.text,
                            phoneController.text,
                            passwordController.text,
                            rePasswordController.text,
                          ),
                        );
                      }
                    },
                    child:
                        state.registerResources.status == Status.loading
                            ? const CircularProgressIndicator()
                            : const Text("Signup"),
                  ),
                  16.spaceVertical,
                  TextButton(
                    onPressed: () {
                      widget.cubit.doAction(NavigateToLoginEvent());
                    },
                    child: const Text(
                      'Already Have Account? Login',
                      style: TextStyle(color: AppColors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
