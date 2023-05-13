import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:synram_practical/api/api_services.dart';
import 'package:synram_practical/model/merchat_report_model.dart';

part 'merchant_report_event.dart';
part 'merchant_report_state.dart';

class MerchantReportBloc extends Bloc<MerchantReportEvent, MerchantReportState> {
  MerchantReportBloc() : super(MerchantReportInitial()) {
    on<GetMerchantReportDataEvent>(_getMerchantReportDataEvent);
  }

  Future<void> _getMerchantReportDataEvent(event,
      Emitter<MerchantReportState> emit) async {
    MerchantReportModel? merchantReportModel;
    emit(MerchantReportInitial(loading: true));
    try {
      merchantReportModel = await ApiServices().getMerchantReportApiData(
          userID: event.userID);
      print('merchantReportModel123 ${merchantReportModel?.data}');
      emit(MerchantReportLoaded(merchantReportModel: merchantReportModel));
      emit(MerchantReportInitial(loading: false));
    } catch (e) {
      print('EROR ${e}');
      //Fluttertoast.showToast(msg: 'Check your connection');
      emit(MerchantReportInitial(loading: false));
    }
  }
}
