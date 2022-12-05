import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project/pages/auth/bloc/auth_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Text(
                "Tacos el camioncito",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 75, 0, 0),
              child: Image.asset(
                'assets/images/pastor-taco.png',
                width: 250,
                height: 250,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 125, 25.0, 0),
              child: ElevatedButton.icon(
                icon: const FaIcon(
                  FontAwesomeIcons.google,
                ),
                onPressed: () {
                  BlocProvider.of<AuthBloc>(context).add(GoogleAuthEvent());
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1.0),
                    )),
                label: const Text(
                  "Log in with Google",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
