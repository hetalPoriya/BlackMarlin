part of 'get_order_bloc.dart';

@immutable
abstract class GetOrderState extends Equatable{}

class GetOrderInitial extends GetOrderState {
  bool? loading;

  GetOrderInitial({this.loading});
  @override
  // TODO: implement props
  List<Object?> get props => [loading];
}

class GetOrderLoaded extends GetOrderState {
  GetOrderModel? getOrderModel;

  GetOrderLoaded({this.getOrderModel});

  @override
  // TODO: implement props
  List<Object?> get props => [getOrderModel];
}
