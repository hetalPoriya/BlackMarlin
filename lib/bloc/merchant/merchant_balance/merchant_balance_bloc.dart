import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:synram_practical/api/api_services.dart';
import 'package:synram_practical/model/merchant_balance_model.dart';

part 'merchant_balance_event.dart';

part 'merchant_balance_state.dart';

class MerchantBalanceBloc
    extends Bloc<MerchantBalanceEvent, MerchantBalanceState> {
  MerchantBalanceBloc() : super(MerchantBalanceInitial()) {
    on<GetMerchantBalanceEventData>(_getMerchantBalanceEventData);
  }

  Future<FutureOr<void>> _getMerchantBalanceEventData(event,
      Emitter<MerchantBalanceState> emit) async {
    MerchantBalanceModel? merchantBalanceModel;
    emit(MerchantBalanceInitial(loading: true));
    try {
      merchantBalanceModel = await ApiServices().getMerchantBalApiData(
          userID: event.userID);
      emit(MerchantBalanceLoaded(merchantBalanceModel: merchantBalanceModel));
      emit(MerchantBalanceInitial(loading: false));
    } catch (e) {
      Fluttertoast.showToast(msg: 'Check your connection');
      emit(MerchantBalanceInitial(loading: false));
    }
  }
}
