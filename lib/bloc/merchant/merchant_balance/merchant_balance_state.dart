part of 'merchant_balance_bloc.dart';

@immutable
abstract class MerchantBalanceState extends Equatable {}

class MerchantBalanceInitial extends MerchantBalanceState {
  bool? loading;

  MerchantBalanceInitial({this.loading});

  @override
  // TODO: implement props
  List<Object?> get props => [loading];
}

class MerchantBalanceLoaded extends MerchantBalanceState {
  MerchantBalanceModel? merchantBalanceModel;

  MerchantBalanceLoaded({this.merchantBalanceModel});
  @override
  // TODO: implement props
  List<Object?> get props => [merchantBalanceModel];
}
