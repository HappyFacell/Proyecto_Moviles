import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/pages/Home/user_home_page.dart';
import 'package:project/pages/Orders/widgets/orderitemcard.dart';
import 'package:project/pages/Orders/bloc/order_bloc.dart';
import 'package:project/pages/Auth/bloc/auth_bloc.dart';

class OrderSummary extends StatefulWidget {
  const OrderSummary({super.key});

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Resumen de Orden"),
        backgroundColor: const Color.fromARGB(255, 164, 59, 27),
      ),
      body: ListView(
        children: [
          const OrderItemCard(
            description: "Taco de pastor",
          ),
          const OrderItemCard(
            description: "Orden de pastor",
          ),
          const OrderItemCard(
            description: "Agua de horchata",
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text("Costo total:"),
                Text("150"),
              ],
            ),
          ),
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is TakerAuthSuccessState) {
                return ElevatedButton(
                  onPressed: () {
                    print("he presionado el boton");
                    BlocProvider.of<OrderBloc>(context).add(CloseOrderEvent(id:'0'));
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text("Confirmar pago"),
                );
              }
              return ElevatedButton(
                onPressed: () {
                  print("he presionado el boton");
                  BlocProvider.of<OrderBloc>(context).add(CreateOrderEvent());
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text("Confirmar orden"),
              );
            },
          )
        ],
      ),
    );
  }
}
