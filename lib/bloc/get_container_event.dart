part of 'get_container_bloc.dart';

@immutable
abstract class GetContainerEvent extends Equatable {}

class onGetContainerEventData extends GetContainerEvent {
  String? userId;
  onGetContainerEventData({this.userId});
  @override
  // TODO: implement props
  List<Object?> get props => [userId];
}
