import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:synram_practical/api/api_services.dart';
import 'package:synram_practical/model/get_container_model.dart';

part 'get_container_event.dart';
part 'get_container_state.dart';

class GetContainerBloc extends Bloc<GetContainerEvent, GetContainerState> {
  GetContainerBloc() : super(GetContainerInitial()) {
    on<onGetContainerEventData>(_getContainerEvent);
  }

  Future<FutureOr<void>> _getContainerEvent(
      onGetContainerEventData event, Emitter<GetContainerState> emit) async {
    emit(GetContainerInitial(loading: true));
    try {
      GetContainerModel? response =
          await ApiServices().getContainersApi(userID: event.userId);
      emit(GetContainerLoaded(getContainerModel: response));
      emit(GetContainerInitial(loading: false));
    } catch (e) {
      print('Error ${e.toString()}');
      emit(GetContainerInitial(loading: false));
      //Fluttertoast.showToast(msg: 'Check your connection');
    }
  }
}
