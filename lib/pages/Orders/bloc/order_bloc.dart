import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderInitialState()) {
    on<CreateOrderEvent>(_createOrder);
    on<CloseOrderEvent>(_closeOrder);
  }
}

FutureOr<void> _createOrder(event, emit) async {
  try {
    print("Hola, voy a crear la orden");
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
