import 'package:flutter/material.dart';
import 'package:project/pages/Orders/order.dart';
import 'package:project/pages/Orders/ordersummary.dart';
import 'pages/Login/login_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: LoginPage(),
    );
  }
}
