part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState extends Equatable {}

class AuthenticationLoading extends AuthenticationState {
  bool? loading = false;

  AuthenticationLoading({this.loading});

  @override
  // TODO: implement props
  List<Object?> get props => [loading];
}

class AuthenticationLoaded extends AuthenticationState {
  var response;

  AuthenticationLoaded({this.response});

  @override
  // TODO: implement props
  List<Object?> get props => [response];
}

class AuthenticationError extends AuthenticationState {
  String? errorString = '';

  AuthenticationError({required this.errorString});

  @override
  // TODO: implement props
  List<Object?> get props => [errorString];
}
