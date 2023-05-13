part of 'merchant_report_bloc.dart';

@immutable
abstract class MerchantReportState extends Equatable {}

class MerchantReportInitial extends MerchantReportState {
  bool? loading;

  MerchantReportInitial({this.loading});
  @override
  // TODO: implement props
  List<Object?> get props => [loading];
}

class MerchantReportLoaded extends MerchantReportState {
  MerchantReportModel? merchantReportModel;

  MerchantReportLoaded({this.merchantReportModel});
  @override
  // TODO: implement props
  List<Object?> get props => [merchantReportModel];
}