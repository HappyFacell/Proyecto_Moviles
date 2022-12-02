part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class CreateOrderEvent extends OrderEvent {}

class CloseOrderEvent extends OrderEvent {}

class GetActualOrderEvent extends OrderEvent {}

class GetPastOrderEvent extends OrderEvent {}