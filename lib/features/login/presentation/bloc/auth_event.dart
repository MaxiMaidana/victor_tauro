part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthLogin extends AuthEvent {
  final User user;

  const AuthLogin(this.user);

  @override
  List<Object> get props => [];
}

class GoToHome extends AuthEvent {}
