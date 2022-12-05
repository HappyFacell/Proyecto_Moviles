import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/pages/order/classes/order.dart';

import '../bloc/order_bloc.dart';
import '../classes/item.dart';
import '../db/order_repository.dart';

class OrderItemCard extends StatefulWidget {
  final OrderDetail detail;
  const OrderItemCard({
    super.key,
    required this.detail,
  });

  @override
  State<OrderItemCard> createState() => _OrderItemCardState();
}

class _OrderItemCardState extends State<OrderItemCard> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderBloc, OrderState>(
      listener: (context, state) {
        if (state is CreatingOrderState) {}
      },
      builder: (context, state) {
        return Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  FutureBuilder<String>(
                    future: getOrderItemName(widget.detail) as Future<String>?,
                    initialData: 'Elemento',
                    builder: (
                      BuildContext context,
                      AsyncSnapshot snapshot,
                    ) {
                      return Text(
                        "${snapshot.data}",
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      );
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text("Total:"),
                  Text("${widget.detail.amount}"),
                  const Text("Costo:"),
                  FutureBuilder<double>(
                    future: getOrderItemTotalPrice(widget.detail)
                        as Future<double>?,
                    initialData: 0,
                    builder: (
                      BuildContext context,
                      AsyncSnapshot snapshot,
                    ) {
                      return Text("${snapshot.data}");
                    },
                  ),
                  Text("${widget.detail.itemId}")
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

FutureOr<double> getOrderItemTotalPrice(OrderDetail detail) async {
  Item item = await OrderRepository().getItem(detail.itemId);
  return detail.amount * item.price;
}

FutureOr<String> getOrderItemName(OrderDetail detail) async {
  Item item = await OrderRepository().getItem(detail.itemId);
  return item.name;
}
