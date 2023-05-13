part of 'ship_bloc.dart';

@immutable
abstract class ShipState extends Equatable {}

class ShipInitial extends ShipState {
  bool? loading;

  ShipInitial({this.loading});
  @override
  // TODO: implement props
  List<Object?> get props => [loading];
}

class ShipDataLoaded extends ShipState {
  ShippingModel? shippingModel;

  ShipDataLoaded({this.shippingModel});

  @override
  // TODO: implement props
  List<Object?> get props => [shippingModel];
}
