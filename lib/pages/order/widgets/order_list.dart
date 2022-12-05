import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/pages/order/widgets/ordercard.dart';

import '../bloc/order_bloc.dart';
import '../classes/order.dart' as order_lib;

class OrderList extends StatefulWidget {
  bool isHistory;
  OrderList({Key? key, required this.isHistory}) : super(key: key);

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  List<order_lib.Order> orders = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderBloc, OrderState>(
      listener: (context, state) {
        if (state is GetOrdersSuccessState) {
          orders = state.userOrders;
        }
        if (state is OrderCloseSuccesfullyState) {
          BlocProvider.of<OrderBloc>(context)
              .add(GetOrdersEvent(isHistory: widget.isHistory));
        }
      },
      builder: (context, state) {
        if (state is GetOrdersSuccessState && orders.isNotEmpty) {
          return ListView(
            children: [
              for (var element in orders)
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
                                if (element.isActive) {
                                  BlocProvider.of<OrderBloc>(context).add(
                                    CloseOrderEvent(id: element.id),
                                  );
                                  Navigator.pop(context);
                                }
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
                  child: OrderCard(
                    order: element,
                  ),
                ),
            ],
          );
        } else if (state is GetOrdersFailureState) {
          return Column(
            children: [
              Text(widget.isHistory
                  ? 'Error mostrando el historial'
                  : 'Error mostrando las ordenes activas'),
            ],
          );
        } else if (state is GetOrderLoadingState) {
          return const CircularProgressIndicator();
        } else {
          return Container(
            alignment: Alignment.center,
            child: Text(widget.isHistory
                ? 'No hay historial'
                : 'No hay órdenes activas'),
          );
        }
      },
    );
  }
}
