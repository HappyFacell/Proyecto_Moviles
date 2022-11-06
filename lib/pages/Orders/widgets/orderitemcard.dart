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
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Total:"),
              Text("5"),
              Text("Costo:"),
              Text("${widget.cost}")
            ],
          ),
        ],
      ),
    );
  }
}
