import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_with_frog_api/features/auth/view/register_page.dart';
import 'package:restaurant_with_frog_api/page/dishes/dish_search_page.dart';
import '../bloc/auth_cubit.dart';
import '../bloc/auth_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController(text: 'phan@yopmail.com');
  final passwordController = TextEditingController(text: '123123');

  void _login() {
    context.read<AuthCubit>().login(
          email: emailController.text.trim(),
          password: passwordController.text,
        );
  }

  @override
  Widget build(BuildContext context) {
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
            children: [
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Mật khẩu'),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _login,
                child: const Text('Đăng nhập'),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const RegisterPage()),
                  );
                },
                child: const Text('Chưa có tài khoản? Đăng ký'),
              ),
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
