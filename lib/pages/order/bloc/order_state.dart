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

class OrderHeaderCreatedSuccesfullyState extends OrderState {
  final order_lib.Order newOrder;
  const OrderHeaderCreatedSuccesfullyState({required this.newOrder});

  @override
  List<Object> get props => [newOrder];
}

class OrderFinishedState extends OrderState {}

class OrderCreationFailedState extends OrderState {}

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
