import 'package:flutter/material.dart';
import 'package:project/pages/order/widgets/orderitemcard.dart';

import '../classes/order.dart';
import '../db/order_repository.dart';

class OrderSummary extends StatefulWidget {
  final Order actualOrder;
  const OrderSummary({super.key, required this.actualOrder});

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Resumen de Orden creada"),
        backgroundColor: const Color.fromARGB(255, 164, 59, 27),
      ),
      body: FutureBuilder<List<OrderDetail>>(
        future: OrderRepository().getOrderDetails(widget.actualOrder)
            as Future<List<OrderDetail>>?,
        initialData: const [],
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return ListView.builder(
            itemCount: (snapshot.data as List<OrderDetail>).length,
            itemBuilder: (BuildContext context, int index) {
              return OrderItemCard(
                detail: snapshot.data[index],
              );
            },
          );
        },
      ),
    );
  }
}

// ListView(
//         children: [
//           const OrderItemCard(
//             description: "Taco de pastor",
//           ),
//           const OrderItemCard(
//             description: "Orden de pastor",
//           ),
//           const OrderItemCard(
//             description: "Agua de horchata",
//           ),
//           Container(
//             margin: const EdgeInsets.all(10),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: const [
//                 Text("Costo total:"),
//                 Text("150"),
//               ],
//             ),
//           ),
//         ],
//       ),