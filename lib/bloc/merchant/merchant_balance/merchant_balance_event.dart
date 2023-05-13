part of 'merchant_balance_bloc.dart';

@immutable
abstract class MerchantBalanceEvent extends Equatable {}

class GetMerchantBalanceEventData extends MerchantBalanceEvent {
  String? userID;

  GetMerchantBalanceEventData({this.userID});

  @override
  // TODO: implement props
  List<Object?> get props => [userID];

}