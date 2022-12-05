import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project/pages/order/classes/order.dart' as order_lib;
import 'package:project/pages/order/db/order_repository.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderInitialState()) {
    on<CreateOrderEvent>(_createOrder);
    on<CloseOrderEvent>(_closeOrder);
    on<GetActualOrderEvent>(_getActualOrder);
    on<GetPastOrderEvent>(_getPastOrder);
  }
}

FutureOr<void> _createOrder(event, emit) async {
  try {
    print("Hola, voy a crear la orden");
    OrderRepository().createNewOrder();
    emit(OrderCreatedSuccesfullyState());
  } catch (e) {
    emit(OrderCreationFailedState());
  }
}

FutureOr<void> _closeOrder(event, emit) async {
  try {
    print("Hola, voy a cerrar la orden");
    String temp = event.toString().substring(16);
    String id = temp.substring(0, 20);
    OrderRepository().closeOrder(id);
    emit(OrderCloseSuccesfullyState());
  } catch (e) {
    emit(OrderCloseFailedState());
  }
}

FutureOr<void> _getActualOrder(event, emit) async {
  try {
    print("Hola voy a obtener la orden");
    List<order_lib.Order> orders = await OrderRepository().getActiveOrders();
    print(orders);
    emit(GetActualOrderSuccesfullyState(userOrders: orders));
  } catch (e) {
    emit(GetActualOrderFailedState());
  }
}

FutureOr<void> _getPastOrder(event, emit) async {
  try {
    print("Hola voy a obtener la orden");
    var order = await OrderRepository().getOrderHistory();
    // print(order);
    emit(GetPastOrderSuccesfullyState(userOrder: order));
  } catch (e) {
    emit(GetPastOrderFailedState());
  }
}
