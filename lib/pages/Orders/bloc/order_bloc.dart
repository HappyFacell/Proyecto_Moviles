import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project/pages/Orders/bloc/order_repository.dart';

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
    OrderRepository().createUserOrderCollectionFirebase();
    emit(OrderCreatedSuccesfullyState());
  } catch (e) {
    emit(OrderCreationFailedState());
  }
}

FutureOr<void> _closeOrder(event, emit) async {
  try {
    print("Hola, voy a cerrar la orden");
    emit(OrderCreatedSuccesfullyState());
  } catch (e) {
    emit(OrderCreationFailedState());
  }
}

FutureOr<void> _getActualOrder(event, emit) async {
  try {
    print("Hola voy a obtener la orden");
    var order = await OrderRepository().getActualOder();
    // print(order);
    emit(GetActualOrderSuccesfullyState(userOrder: order));
  } catch (e) {
    emit(GetActualOrderFailedState());
  }
}

FutureOr<void> _getPastOrder(event, emit) async {
  try {
    print("Hola voy a obtener la orden");
    var order = await OrderRepository().getpastOder();
    // print(order);
    emit(GetPastOrderSuccesfullyState(userOrder: order));
  } catch (e) {
    emit(GetPastOrderFailedState());
  }
}
