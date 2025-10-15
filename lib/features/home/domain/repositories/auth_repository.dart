import '../../data/models/user.dart';

abstract class AuthRepository {
  Future<User?> signUp(String name, String email, String password);
  Future<User?> signIn(String email, String password);
  Future<void> signOut();
  Future<User?> getCurrentUser();
  Future<bool> isEmailTaken(String email);
}
