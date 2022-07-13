import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

import '../models/user.dart';
import '../../features/login/domain/repository/auth_repository.dart';
import '../datasource/datasource.dart';
import '../models/response.dart';

class AuthRepository implements RAuthRepository {
  // final DataSource _dataSource;
  // AuthRepository({required DataSource dataSource}) : _dataSource = dataSource;
  @override
  Future<bool> signIn({required String user, required String password}) async {
    try {
      final data = await rootBundle.loadString('lib/core/data_fake/users.json');

      Map<String, dynamic> dataMap = json.decode(data);

      List<User> users = List<User>.from(
        dataMap['credentials'].map((user) => User.fromJson(user)),
      );

      for (int i = 0; i < users.length; i++) {
        if (users[i].user == user && users[i].password == password) {
          return true;
        }
      }
      return false;
    } catch (e) {
      if (e is DioError) {
        throw ResponseModel(statusCode: 403, data: false);
      } else {
        rethrow;
      }
    }
  }
}
