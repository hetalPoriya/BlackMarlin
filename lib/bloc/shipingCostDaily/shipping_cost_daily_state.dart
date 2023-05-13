part of 'shipping_cost_daily_bloc.dart';

@immutable
abstract class ShippingCostDailyState {}

class ShippingCostDailyLoading extends ShippingCostDailyState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ShippingCostDailyLoaded extends ShippingCostDailyState {
  ShippingDailyCostModel? shippingDailyCostData;

  ShippingCostDailyLoaded({this.shippingDailyCostData});

  @override
  // TODO: implement props
  List<Object?> get props => [shippingDailyCostData];
}

// class GetNewsDataLoaded extends ShippingCostDailyState {
//   NewsModel? newsModel;
//
//   GetNewsDataLoaded({this.newsModel});
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [newsModel];
// }

class ShippingCostDailyError extends ShippingCostDailyState {
  String? errorString = '';

  ShippingCostDailyError({required this.errorString});

  @override
  // TODO: implement props
  List<Object?> get props => [errorString];
}
