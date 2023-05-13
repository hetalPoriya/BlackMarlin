part of 'merchant_report_bloc.dart';

@immutable
abstract class MerchantReportEvent extends Equatable{}

class GetMerchantReportDataEvent extends MerchantReportEvent{
String? userID;
  GetMerchantReportDataEvent({this.userID});
  @override
  // TODO: implement props
  List<Object?> get props => [userID];

}


