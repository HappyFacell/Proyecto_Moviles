import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/order_bloc.dart';

class OrderItemCard extends StatefulWidget {
  final String description;
  final double cost;
  const OrderItemCard({
    super.key,
    this.description = "Taco de pastor",
    this.cost = 10,
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
                  Text(
                    widget.description,
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
                  const Text("5"),
                  const Text("Costo:"),
                  Text("${widget.cost}")
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
