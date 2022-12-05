import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/pages/order/classes/order.dart';
import 'package:project/pages/order/db/order_repository.dart';

import '../bloc/order_bloc.dart';
import '../classes/item.dart';

class ItemCard extends StatefulWidget {
  final Item item;
  const ItemCard({
    super.key,
    required this.item,
  });

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  int quantity = 0;
  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderBloc, OrderState>(
      listener: (context, state) {
        if (state is OrderHeaderCreatedSuccesfullyState && quantity > 0) {
          OrderDetail newOrderDetail = OrderDetail(
            amount: quantity,
            id: '',
            itemId: widget.item.id,
            orderId: state.newOrder.id,
          );
          OrderRepository().addOrderDetail(
            state.newOrder,
            newOrderDetail,
          );
        }
      },
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image(
              image: AssetImage(widget.item.img),
            ),
            Text(
              widget.item.name,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              'Precio: \$${widget.item.price}',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (quantity > 0) {
                        quantity--;
                      }
                    });
                  },
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    size: 30,
                  ),
                ),
                Text('$quantity'),
                IconButton(
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                  icon: const Icon(
                    Icons.keyboard_arrow_up,
                    size: 30,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
