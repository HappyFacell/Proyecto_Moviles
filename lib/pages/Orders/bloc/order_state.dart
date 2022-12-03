part of 'order_bloc.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

class OrderInitialState extends OrderState {}

class OrderPendingState extends OrderState {}

class OrderCreatedSuccesfullyState extends OrderState {}

class OrderFinishedState extends OrderState {}

class OrderCreationFailedState extends OrderState {}

class GetPastOrderFailedState extends OrderState {}

class GetActualOrderFailedState extends OrderState {}

class GetActualOrderSuccesfullyState extends OrderState {
  final List<Map<String, dynamic>> userOrder;

  const GetActualOrderSuccesfullyState({required this.userOrder});

  @override
  List<Object> get props => [userOrder];
}

class GetPastOrderSuccesfullyState extends OrderState {
  final List<Map<String, dynamic>> userOrder;

  const GetPastOrderSuccesfullyState({required this.userOrder});

  @override
  List<Object> get props => [userOrder];
}

class OrderCloseSuccesfullyState extends OrderState {}

class OrderCloseFailedState extends OrderState {}