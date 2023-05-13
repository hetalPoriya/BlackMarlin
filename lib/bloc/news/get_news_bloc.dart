import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:synram_practical/api/api_services.dart';
import 'package:synram_practical/model/news_model.dart';

part 'get_news_event.dart';
part 'get_news_state.dart';

class GetNewsBloc extends Bloc<GetNewsEvent, GetNewsState> {
  GetNewsBloc() : super(GetNewsInitial()) {
    on<GetNewsEvent>(_getNewsData) ;
  }

  Future<void> _getNewsData(
      event, Emitter<GetNewsState> emit) async {
    emit(GetNewsInitial());
    try {
      NewsModel? newsModel;
      newsModel = await ApiServices()
          .getNewsApiData();
      emit(GetNewsLoaded(newsModel: newsModel));
    } catch (e) {
      Fluttertoast.showToast(msg: 'Check your connection');
    }
  }
}
