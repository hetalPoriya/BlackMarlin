part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {}

class LogInButtonPressed extends AuthenticationEvent {
  String? username;
  String? password;

  LogInButtonPressed({this.username, this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [username, password];
}
