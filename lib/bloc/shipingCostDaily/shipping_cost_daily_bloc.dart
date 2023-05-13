import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:synram_practical/api/api_services.dart';
import 'package:synram_practical/model/news_model.dart';
import 'package:synram_practical/model/shippingCost_model.dart';

part 'shipping_cost_daily_event.dart';
part 'shipping_cost_daily_state.dart';

class ShippingCostDailyBloc extends Bloc<ShippingCostDailyEvent, ShippingCostDailyState> {
  ShippingCostDailyBloc() : super(ShippingCostDailyLoading()) {
    on<ShippingCostData>(_shippingCostData);

  }

  Future<void> _shippingCostData(
      event, Emitter<ShippingCostDailyState> emit) async {
    emit(ShippingCostDailyLoading());
    try {
      ShippingDailyCostModel? shippingDailyCostData;
      shippingDailyCostData = await ApiServices()
          .shippingCostDailyApi(date: event.date);
      emit(ShippingCostDailyLoaded(shippingDailyCostData: shippingDailyCostData));
    } catch (e) {
      Fluttertoast.showToast(msg: 'Check your connection');
    }
  }


}
