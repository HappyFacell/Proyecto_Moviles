//TODO: usar como base foto_Share e implementar firebase.
//TODO usar paginas de order_details, details, crear pagina de orden actual.

import 'package:flutter/material.dart';
import 'package:project/pages/Orders/order.dart';
import 'package:project/pages/actual_order/actual_order.dart';
import 'package:project/pages/details/details.dart';
import 'package:project/pages/pass_order/pass_order.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentpage = 0;

  final _pageNameList = [
    "Orden actual",
    "Ordenes pasadas",
    "Ordenar",
    "Detalle de tienda"
  ];

  final _pageList = [
    const ActualOrder(),
    const PassOrder(),
    const Order(),
    const Detalles()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageNameList[_currentpage]),
        backgroundColor: Colors.brown[700],
      ),
      body: IndexedStack(
        index: _currentpage,
        children: _pageList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentpage,
        onTap: (value) {
          setState(
            () {
              _currentpage = value;
            },
          );
        },
        selectedItemColor: Colors.brown,
        backgroundColor: Colors.yellow[100],
        items: [
          BottomNavigationBarItem(
            label: _pageNameList[0],
            icon: const Icon(Icons.view_carousel),
          ),
          BottomNavigationBarItem(
            label: _pageNameList[1],
            icon: const Icon(Icons.query_builder),
          ),
          BottomNavigationBarItem(
            label: _pageNameList[2],
            icon: const Icon(Icons.photo_camera),
          ),
          BottomNavigationBarItem(
            label: _pageNameList[3],
            icon: const Icon(Icons.library_books),
          ),
        ],
      ),
    );
  }
}
