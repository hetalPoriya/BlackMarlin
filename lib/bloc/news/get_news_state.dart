part of 'get_news_bloc.dart';

@immutable
abstract class GetNewsState extends Equatable {}

class GetNewsInitial extends GetNewsState {
  bool? loading;

  GetNewsInitial({this.loading});
  @override
  // TODO: implement props
  List<Object?> get props => [loading];
}

class GetNewsLoaded extends GetNewsState{
  NewsModel? newsModel;

  GetNewsLoaded({this.newsModel});
  @override
  // TODO: implement props
  List<Object?> get props => [newsModel];

}