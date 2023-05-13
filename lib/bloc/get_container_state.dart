part of 'get_container_bloc.dart';

@immutable
abstract class GetContainerState extends Equatable {}

class GetContainerInitial extends GetContainerState {
  bool? loading;
  GetContainerInitial({this.loading});

  @override
  // TODO: implement props
  List<Object?> get props => [loading];
}

class GetContainerLoaded extends GetContainerState {
  GetContainerModel? getContainerModel;

  GetContainerLoaded({this.getContainerModel});

  @override
  // TODO: implement props
  List<Object?> get props => [getContainerModel];
}
