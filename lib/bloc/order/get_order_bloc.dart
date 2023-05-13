import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:synram_practical/api/api_services.dart';
import 'package:synram_practical/model/getOrder_model.dart';

part 'get_order_event.dart';

part 'get_order_state.dart';

class GetOrderBloc extends Bloc<GetOrderEvent, GetOrderState> {
  GetOrderBloc() : super(GetOrderInitial()) {
    on<GetOrderDataEvent>(_getOrderData);
  }

  Future<void> _getOrderData(event, Emitter<GetOrderState> emit) async {
    GetOrderModel? getOrderModel;
    emit(GetOrderInitial(loading:true));
    try {
      getOrderModel = await ApiServices().getOrderApiData(
          userId: event.userId, search: event.search, year: event.year) ;
      emit(GetOrderLoaded(getOrderModel: getOrderModel));
      emit(GetOrderInitial(loading:false));
    } catch (e) {
      print('Error ${e.toString()}');
      emit(GetOrderInitial(loading: false));
      Fluttertoast.showToast(msg: 'Check your connection');
    }
  }
}
