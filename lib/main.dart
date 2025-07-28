// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_with_frog_api/features/auth/bloc/auth_cubit.dart';
import 'package:restaurant_with_frog_api/features/auth/view/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        home: SplashPage(), // dùng splash để đợi check auth
      ),
    );
  }
}
