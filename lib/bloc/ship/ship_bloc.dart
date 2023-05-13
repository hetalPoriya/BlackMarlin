import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:synram_practical/api/api_services.dart';
import 'package:synram_practical/model/shipping_model.dart';

part 'ship_event.dart';
part 'ship_state.dart';

class ShipBloc extends Bloc<ShipEvent, ShipState> {
  ShipBloc() : super(ShipInitial()) {
    on<GetShipEventData>(_getShipEventData);
  }

  Future<void> _getShipEventData(
      GetShipEventData event, Emitter<ShipState> emit) async {
    ShippingModel? shippingModel;
    emit(ShipInitial(loading: true));
    try {
      shippingModel = await ApiServices().shipDataApi(
          api_key: event.api_key, number: event.number, sealine: event.sealine);
      emit(ShipDataLoaded(shippingModel: shippingModel));
      emit(ShipInitial(loading: false));
    } catch (e) {
      print('Error ${e.toString()}');
      emit(ShipInitial(loading: false));
      Fluttertoast.showToast(msg: 'Check your connection');
    }
  }
}
