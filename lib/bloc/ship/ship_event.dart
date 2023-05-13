part of 'ship_bloc.dart';

@immutable
abstract class ShipEvent extends Equatable {}

class GetShipEventData extends ShipEvent {
  String? number;
  String? sealine;
  String? api_key;

  GetShipEventData({this.number, this.sealine, this.api_key});
  @override
  // TODO: implement props
  List<Object?> get props => [number, sealine, api_key];
}
