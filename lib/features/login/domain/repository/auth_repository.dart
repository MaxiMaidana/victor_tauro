abstract class RAuthRepository {
  Future<bool> signIn({required String user, required String password});
}
