part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class CreateOrderEvent extends OrderEvent {}

class CloseOrderEvent extends OrderEvent {
  final String id;

  const CloseOrderEvent({required this.id});
  @override
  List<Object> get props => [id];
}

class GetOrdersEvent extends OrderEvent {
  final bool isHistory;

  const GetOrdersEvent({required this.isHistory});
  @override
  List<Object> get props => [isHistory];
}
