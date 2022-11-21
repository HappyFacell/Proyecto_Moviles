import 'package:flutter/material.dart';
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
        title: const Text("Resumen de Orden"),
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
          ElevatedButton(onPressed: () {}, child: const Text("Confirmar pago"))
        ],
      ),
    );
  }
}
