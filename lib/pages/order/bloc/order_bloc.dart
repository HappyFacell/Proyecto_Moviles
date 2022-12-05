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
    on<GetOrdersEvent>(_getOrders);
  }
}

FutureOr<void> _createOrder(CreateOrderEvent event, emit) async {
  try {
    print("Hola, voy a crear la orden");
    order_lib.Order neworder = await OrderRepository().createNewOrder();
    emit(OrderHeaderCreatedSuccesfullyState(newOrder: neworder));
  } catch (e) {
    emit(OrderCreationFailedState());
  }
}

FutureOr<void> _closeOrder(CloseOrderEvent event, emit) async {
  try {
    print("Hola, voy a cerrar la orden");
    OrderRepository().closeOrder(event.id);
    emit(OrderCloseSuccesfullyState());
  } catch (e) {
    emit(OrderCloseFailedState());
  }
}

FutureOr<void> _getOrders(GetOrdersEvent event, emit) async {
  try {
    print("Hola voy a obtener la orden");
    var orders;
    if (event.isHistory) {
      orders = await OrderRepository().getOrderHistory();
    } else {
      orders = await OrderRepository().getActiveOrders();
    }

    // print(order);
    emit(GetOrdersSuccessState(userOrders: orders));
  } catch (e) {
    emit(GetOrdersFailureState());
  }
}
