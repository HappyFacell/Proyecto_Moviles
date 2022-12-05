import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/pages/order/classes/item.dart';
import 'package:project/pages/order/db/order_repository.dart';
import '../../auth/bloc/auth_bloc.dart';
import '../bloc/order_bloc.dart';
import 'ordersummary_page.dart';
import 'package:project/pages/order/widgets/itemcard.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Item>>(
        future: OrderRepository().getAllItems() as Future<List<Item>>?,
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: (snapshot.data as List<Item>).length,
                  itemBuilder: (BuildContext context, int index) {
                    return ItemCard(
                      item: snapshot.data[index],
                    );
                  },
                ),
              ),
              BlocListener<OrderBloc, OrderState>(
                listener: (context, state) {
                  if (state is OrderHeaderCreatedSuccesfullyState) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderSummary(
                          actualOrder: state.newOrder,
                        ),
                      ),
                    );
                  }
                },
                child: ElevatedButton(
                  onPressed: () {
                    print("he presionado el boton");
                    BlocProvider.of<OrderBloc>(context).add(CreateOrderEvent());
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text("Confirmar pago"),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
