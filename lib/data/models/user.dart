import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String user;
  final String password;

  const User({required this.user, required this.password});

  @override
  List<Object?> get props => [user, password];

  static List<User> users = [
    const User(user: 'solano', password: 'solano'),
    const User(user: 'quilmes', password: 'quilmes'),
    const User(user: 'victor', password: 'victor'),
  ];

  static User fromJson(Map<String, dynamic> json) =>
      User(user: json['user'], password: json['password']);

  Map<String, dynamic> toJson() => {
        'user': user,
        'password': password,
      };
}
