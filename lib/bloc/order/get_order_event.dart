part of 'get_order_bloc.dart';

@immutable
abstract class GetOrderEvent extends Equatable{}

class GetOrderDataEvent extends GetOrderEvent{
  String? userId;
  String? search;
  String? year;

  GetOrderDataEvent({this.year,this.userId,this.search});
  @override
  // TODO: implement props
  List<Object?> get props => [userId,search,year];

}
