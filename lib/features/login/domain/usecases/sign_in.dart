import '../../../../data/repository/auth/auth_repository.dart';

class SignIn {
  // SignIn();

  Future<bool> call({required String user, required String password}) async {
    try {
      bool res = await AuthRepository().signIn(user: user, password: password);
      return res;
    } catch (e) {
      rethrow;
    }
  }
}
