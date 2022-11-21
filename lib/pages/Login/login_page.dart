import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

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
              padding: EdgeInsets.all(24.0),
              child: Text(
                "Log In",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(24.0),
              child: const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(24.0),
              child: const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Forgot Password',
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
              child: ElevatedButton.icon(
                icon: const FaIcon(
                  FontAwesomeIcons.google,
                ),
                onPressed: () {
                  //BlocProvider.of<AuthBloc>(context).add(GoogleAuthEvent());
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: const Color.fromARGB(186, 240, 99, 99),
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
