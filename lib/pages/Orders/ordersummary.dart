import 'package:flutter/material.dart';
import 'package:project/pages/Orders/widgets/itemcard.dart';

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
          ItemCard(
            img: "assets/images/taco_pastor.jpg",
            description: "Taco de pastor",
          ),
          ItemCard(
            img: "assets/images/orden_pastor.jpg",
            description: "Orden de pastor",
          ),
          ItemCard(
            img: "assets/images/agua_horchata.png",
            description: "Agua de horchata",
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Costo total:"),
                Text("300"),
              ],
            ),
          ),
          ElevatedButton(onPressed: () {}, child: Text("Pagar"))
        ],
      ),
    );
  }
}
