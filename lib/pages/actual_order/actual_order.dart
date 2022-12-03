import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/pages/Orders/bloc/order_bloc.dart';

class ActualOrder extends StatelessWidget {
  ActualOrder({super.key});

  late List<Map<String, dynamic>> _userOrder = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderBloc, OrderState>(
      listener: (context, state) {
        if (state is GetActualOrderSuccesfullyState) {
          _userOrder = state.userOrder;
        }
        if (state is OrderCloseSuccesfullyState) {
          BlocProvider.of<OrderBloc>(context).add(GetActualOrderEvent());
        }
      },
      builder: (context, state) {
        if (state is GetActualOrderSuccesfullyState && _userOrder.isNotEmpty) {
          return ListView(
            children: [
              for (var element in _userOrder)
                GestureDetector(
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: const Text('Ya recibio su orden?'),
                          actions: [
                            TextButton(
                              child: const Text('Si'),
                              onPressed: () {
                                var id;
                                element.forEach((key, value) {
                                  if (key == 'orderId') {
                                    id = value;
                                  }
                                });
                                BlocProvider.of<OrderBloc>(context).add(
                                  CloseOrderEvent(id: id.toString()),
                                );
                                Navigator.pop(context);
                              },
                            ),
                            TextButton(
                              child: const Text('No'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Column(
                    children: [
                      for (var x in element.keys)
                        if (x != 'orderId')
                          Row(
                            children: [
                              Text('$x: ${element[x]}'),
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
                ),
            ],
          );
        } else if (state is GetActualOrderFailedState) {
          return Column(
            children: const [
              Text('Ordenes Actuales'),
            ],
          );
        } else if (state is GetOrderLoadingState) {
          return const CircularProgressIndicator();
        } else {
          return const Text('Aun no tienes Ordenes en proceso');
        }
      },
    );
  }
}
