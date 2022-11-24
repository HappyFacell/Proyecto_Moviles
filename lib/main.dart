import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/pages/Auth/bloc/auth_bloc.dart';

import 'package:project/pages/Home/user_home_page.dart';
import 'package:project/pages/Login/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    BlocProvider(
      create: (context) => AuthBloc(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taqueria APP',
      home: BlocConsumer<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccessState) {
            return const HomePage();
          } else if (state is UnAuthState ||
              state is AuthErrorState ||
              state is SignOutSuccessState) {
            return const LoginPage();
          }
          return const LoginPage();
        },
        listener: (context, state) {},
      ),
    );
  }
}
