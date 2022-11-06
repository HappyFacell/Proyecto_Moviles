import 'package:flutter/material.dart';
import 'package:project/pages/Orders/widgets/itemcard.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personalizar orden"),
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
        ],
      ),
    );
  }
}
