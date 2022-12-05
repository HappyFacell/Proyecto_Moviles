//TODO: usar como base foto_Share e implementar firebase.
//TODO usar paginas de order_details, details, crear pagina de orden actual.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/pages/Home/qr_scan.dart';
import 'package:project/pages/auth/bloc/auth_bloc.dart';
import 'package:project/pages/order/bloc/order_bloc.dart';
import 'package:project/pages/order/views/order_page.dart';
import '../order/widgets/actual_orders_list.dart';
import 'package:project/pages/details/details_page.dart';
import 'package:project/pages/order/widgets/past_orders_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentpage = 0;

  final _pageNameList = [
    "Actuales",
    "Historial",
    "Editar",
    "Detalle",
  ];

  final _pageList = [
    ActualOrder(),
    PastOrder(),
    Order(),
    Detalles(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(_pageNameList[_currentpage]),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(175, 0, 15, 0),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QRViewExample(),
                  ),
                );
                },
                icon: const Icon(Icons.qr_code),
              ),
            ),
            IconButton(
              onPressed: () {
                BlocProvider.of<AuthBloc>(context).add(SignOutEvent());
              },
              icon: const Icon(Icons.logout),
            )
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 164, 59, 27),
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
          if (_currentpage == 0) {
            BlocProvider.of<OrderBloc>(context).add(GetActualOrderEvent());
          } else if (_currentpage == 1) {
            BlocProvider.of<OrderBloc>(context).add(GetPastOrderEvent());
          }
        },
        selectedItemColor: const Color.fromARGB(255, 139, 137, 136),
        unselectedItemColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 164, 59, 27),
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
