import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/pages/Auth/bloc/auth_bloc.dart';
import 'package:project/pages/Home/user_home_page.dart';
import 'pages/Login/login_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      // home: BlocConsumer<AuthBloc, AuthState>(
      //   builder: (context, state) {
      //     if (state is AuthSuccessState) {
      //       return const HomePage();
      //     } else if (state is UnAuthState ||
      //         state is AuthErrorState ||
      //         state is SignOutSuccessState) {
      //       return const LoginPage();
      //     }
      //     return const Center(
      //       child: LoginPage(),
      //     );
      //   },
      //   listener: (context, state) {},
      // ),
      home: HomePage(),
    );
  }
}
