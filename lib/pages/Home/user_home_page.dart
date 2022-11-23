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
    "Personalizar orden",
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_pageNameList[_currentpage]),
            IconButton(
              onPressed: () {
                // BlocProvider.of<AuthBloc>(context)
                //               .add(SignOutEvent());
              },
              icon: const Icon(Icons.logout),
            )
          ],
        ),
        backgroundColor: Color.fromARGB(255, 164, 59, 27),
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
        selectedItemColor: Color.fromARGB(255, 139, 137, 136),
        unselectedItemColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 164, 59, 27),
        items: [
          BottomNavigationBarItem(
            label: _pageNameList[0],
            icon: Image.asset(
              'assets/images/paper-plane.png',
              height: 30,
              color: Colors.white,
            ),
          ),
          BottomNavigationBarItem(
            label: _pageNameList[1],
            icon: const Icon(Icons.query_builder),
          ),
          BottomNavigationBarItem(
            label: _pageNameList[2],
            icon: const Icon(Icons.edit_note),
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
