import 'package:flutter/material.dart';

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
  }
}
