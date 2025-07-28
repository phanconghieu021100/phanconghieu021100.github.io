import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_with_frog_api/features/auth/bloc/auth_cubit.dart';
import 'package:restaurant_with_frog_api/features/auth/bloc/auth_state.dart';
import 'package:restaurant_with_frog_api/features/auth/view/login_page.dart';
import 'package:restaurant_with_frog_api/page/dishes/dish_search_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthAuthenticated) {
          return  DishSearchPage();
        } else if (state is AuthUnauthenticated) {
          return const LoginPage();
        } else if (state is AuthLoading || state is AuthInitial) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else {
          return const LoginPage(); // fallback
        }
      },
    );
  }
}
