import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/pages/Orders/bloc/order_bloc.dart';

class PassOrder extends StatelessWidget {
  const PassOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Ordenes pasadas"),
        ElevatedButton(
          onPressed: () {
            print("he presionado el boton");
            BlocProvider.of<OrderBloc>(context).add(GetOrderEvent());
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          child: const Text("Sacar orden"),
        )
      ],
    );
  }
}
