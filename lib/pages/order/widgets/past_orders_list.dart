import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/pages/order/bloc/order_bloc.dart';
import 'package:project/pages/order/views/ordersummary_page.dart';
import '../classes/order.dart' as order_lib;

class PastOrder extends StatelessWidget {
  PastOrder({super.key});

  late List<order_lib.Order> _userOrder;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderBloc, OrderState>(
      listener: (context, state) {
        if (state is GetPastOrderSuccesfullyState) {
          _userOrder = state.userOrder;
        }
        if (state is OrderCloseSuccesfullyState) {
          BlocProvider.of<OrderBloc>(context).add(GetPastOrderEvent());
        }
      },
      builder: (context, state) {
        if (state is GetPastOrderSuccesfullyState && _userOrder.isNotEmpty) {
          return ListView(
            children: [
              for (var element in _userOrder)
                Column(
                  children: [
                    for (var x in element.toMap().keys)
                      Row(
                        children: [
                          Container(
                              child: Column(
                            children: [
                              Text('$x: ${element.toMap()[x]}'),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const OrderSummary(),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green),
                                child: const Text("Ver Detalle"),
                              )
                            ],
                          )),
                        ],
                      ),
                    const Divider(
                      height: 30,
                      thickness: 1,
                      indent: 10,
                      endIndent: 10,
                      color: Colors.black87,
                    )
                  ],
                ),
            ],
          );
        } else if (state is GetPastOrderFailedState) {
          return Column(
            children: const [
              Text('Ordenes pasadas'),
            ],
          );
        } else if (state is GetOrderLoadingState) {
          return const CircularProgressIndicator();
        } else {
          return const Text('Aun no tienes Ordenes entregadas');
        }
      },
    );
  }
}
