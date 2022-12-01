import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/pages/Orders/bloc/order_bloc.dart';

class PassOrder extends StatelessWidget {
  PassOrder({super.key});

  late List<Map<String, dynamic>> _userOrder;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderBloc, OrderState>(
      listener: (context, state) {
        if (state is GetOrderSuccesfullyState) {
          _userOrder = state.userOrder;
        }
      },
      builder: (context, state) {
        if (state is GetOrderSuccesfullyState) {
          print('Estado correcto');
          print(_userOrder);
          return Column(
            children: [
              Text(
                  '${_userOrder[0].entries.first.key}: ${_userOrder[0].entries.first.value}'),
            ],
          );
        }
        return Column(
          children: [Text('Ordenes pasadas')],
        );
      },
    );
  }
}
