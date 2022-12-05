import 'package:flutter/material.dart';
import 'package:project/pages/order/classes/order.dart';
import 'package:project/pages/order/db/order_repository.dart';

class OrderCard extends StatefulWidget {
  Order order;

  OrderCard({Key? key, required this.order}) : super(key: key);

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                widget.order.id,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text("Total:"),
              FutureBuilder<int>(
                future: OrderRepository().getOrderTotalQuantity(widget.order)
                    as Future<int>?,
                initialData: 0,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return Text("${snapshot.data}");
                },
              ),
              const Text("Costo:"),
              FutureBuilder<double>(
                future: OrderRepository().getOrderTotalPrice(widget.order)
                    as Future<double>?,
                initialData: 0,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return Text("${snapshot.data}");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
