import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/pages/Orders/bloc/order_bloc.dart';

class PastOrder extends StatelessWidget {
  PastOrder({super.key});

  late List<Map<String, dynamic>> _userOrder;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderBloc, OrderState>(
      listener: (context, state) {
        if (state is GetPastOrderSuccesfullyState) {
          _userOrder = state.userOrder;
        }
      },
      builder: (context, state) {
        if (state is GetPastOrderSuccesfullyState && _userOrder.isNotEmpty) {
          print('Estado correcto');
          print(_userOrder);
          return ListView(
            children: [
              for (var element in _userOrder)
                Column(
                  children: [
                    for (var x in element.keys)
                      Row(
                        children: [
                          Text('$x: ${element[x]}'),
                        ],
                      ),
                    const Divider(
                      height: 30,
                      thickness: 1,
                      indent: 10,
                      endIndent: 10,
                      color: Colors.black87,
                    )
                  ],
                ),
            ],
          );
        } else if (state is GetPastOrderFailedState) {
          return Column(
            children: const [
              Text('Ordenes pasadas'),
            ],
          );
        }
        return Column(
          children: const [
            Text('Ordenes pasadas'),
          ],
        );
      },
    );
  }
}
