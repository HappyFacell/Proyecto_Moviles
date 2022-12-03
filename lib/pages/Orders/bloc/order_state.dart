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
