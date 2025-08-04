import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_with_frog_api/features/auth/bloc/auth_cubit.dart';
import 'package:restaurant_with_frog_api/features/auth/bloc/auth_state.dart';
import 'package:restaurant_with_frog_api/features/auth/view/login_page_mobile.dart';
import 'package:restaurant_with_frog_api/features/auth/view/register_page.dart';
import 'package:restaurant_with_frog_api/page/dishes/dish_search_page.dart';
import 'package:restaurant_with_frog_api/utils/responsive_widget.dart';

class LoginPage extends ResponsiveWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginPage({super.key});

  void _login(BuildContext context) {
    context.read<AuthCubit>().login(
          email: emailController.text.trim(),
          password: passwordController.text,
        );
  }

  @override
  Widget buildMobile(BuildContext context) => _buildContent(
        context,
        LoginPageMobile(
          emailController: emailController,
          passwordController: passwordController,
          onLogin: () => _login(context),
        ),
      );

  @override
  Widget buildTablet(BuildContext context) => buildMobile(context);

  @override
  Widget buildDesktop(BuildContext context) => _buildContent(
        context,
        Center(
          child: SizedBox(
            width: 400,
            child: LoginPageMobile(
              emailController: emailController,
              passwordController: passwordController,
              onLogin: () => _login(context),
            ),
          ),
        ),
      );

  Widget _buildContent(BuildContext context, Widget child) {
    return Scaffold(
      appBar: AppBar(title: const Text('Đăng nhập')),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => DishSearchPage()),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              child,
              const SizedBox(height: 16),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return const CircularProgressIndicator();
                  }
                  if (state is AuthError) {
                    return Text(state.message,
                        style: const TextStyle(color: Colors.red));
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
