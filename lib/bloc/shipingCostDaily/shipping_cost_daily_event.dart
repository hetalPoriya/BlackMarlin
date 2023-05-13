part of 'shipping_cost_daily_bloc.dart';

@immutable
abstract class ShippingCostDailyEvent {}

class ShippingCostData extends ShippingCostDailyEvent {
  String? date;
  ShippingCostData({this.date});

  @override
  // TODO: implement props
  List<Object?> get props => [date];
}

// class GetNewsData extends ShippingCostDailyEvent{
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [];
//
// }
