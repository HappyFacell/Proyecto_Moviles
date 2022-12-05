part of 'order_bloc.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

class OrderInitialState extends OrderState {}

class OrderPendingState extends OrderState {}

class CreatingOrderState extends OrderState {}

class OrderCreatedSuccesfullyState extends OrderState {}

class OrderFinishedState extends OrderState {}

class OrderCreationFailedState extends OrderState {}

class GetPastOrderFailedState extends OrderState {}

class GetActualOrderFailedState extends OrderState {}

class GetActualOrderSuccesfullyState extends OrderState {
  final List<order_lib.Order> userOrders;

  const GetActualOrderSuccesfullyState({required this.userOrders});

  @override
  List<Object> get props => [userOrders];
}

class GetPastOrderSuccesfullyState extends OrderState {
  final List<order_lib.Order> userOrder;

  const GetPastOrderSuccesfullyState({required this.userOrder});

  @override
  List<Object> get props => [userOrder];
}

class OrderCloseSuccesfullyState extends OrderState {}

class OrderCloseFailedState extends OrderState {}

class GetOrderLoadingState extends OrderState {}

class GetOrdersLoadingState extends OrderState {}

class GetOrdersSuccessState extends OrderState {
  final List<order_lib.Order> userOrders;
  const GetOrdersSuccessState({required this.userOrders});

  @override
  List<Object> get props => [userOrders];
}

class GetOrdersFailureState extends OrderState {}
