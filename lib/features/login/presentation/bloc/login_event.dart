part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class InitialEvent extends LoginEvent {}

class Login extends LoginEvent {
  final User user;

  const Login(this.user);

  @override
  List<Object> get props => [];
}
