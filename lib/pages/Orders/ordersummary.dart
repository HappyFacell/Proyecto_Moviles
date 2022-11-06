import 'package:flutter/material.dart';
import 'package:project/pages/Orders/widgets/itemcard.dart';
import 'package:project/pages/Orders/widgets/orderitemcard.dart';

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
        title: Text("Resumen de Orden"),
      ),
      body: ListView(
        children: [
          OrderItemCard(
            description: "Taco de pastor",
          ),
          OrderItemCard(
            description: "Orden de pastor",
          ),
          OrderItemCard(
            description: "Agua de horchata",
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Costo total:"),
                Text("150"),
              ],
            ),
          ),
          ElevatedButton(onPressed: () {}, child: Text("Confirmar pago"))
        ],
      ),
    );
  }
}
