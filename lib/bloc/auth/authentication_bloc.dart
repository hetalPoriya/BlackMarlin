import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:synram_practical/api/api_services.dart';
import 'package:synram_practical/utils/shared_pref.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationLoading()) {
    on<LogInButtonPressed>(_onLogInButtonPressed);
  }

  Future<void> _onLogInButtonPressed(
      event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading(loading: true));
    try {
      var response = await ApiServices()
          .loginApi(username: event.username, password: event.password);
      emit(AuthenticationLoaded(response: response));
      emit(AuthenticationLoading(loading: false));
    } catch (e) {
      Fluttertoast.showToast(msg: 'Check your connection');
      emit(AuthenticationLoading(loading: false));
    }
  }
}
