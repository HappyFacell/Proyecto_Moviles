import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/pages/home/user_home_page.dart';
import 'package:project/pages/auth/views/login_page.dart';
import 'package:project/pages/auth/bloc/auth_bloc.dart';
import 'package:project/pages/order/bloc/order_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => OrderBloc(),
        ),
      ],
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
          if (state is AuthSuccessState || state is TakerAuthSuccessState) {
            BlocProvider.of<OrderBloc>(context).add(GetActualOrderEvent());
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
