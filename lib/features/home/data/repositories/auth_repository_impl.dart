import '../../../../core/services/storage_service.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/user.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<User?> signUp(String name, String email, String password) async {
    try {
      // Check if email is already taken
      if (await isEmailTaken(email)) {
        return null;
      }

      // Create new user
      final user = User.create(name: name, email: email, password: password);

      // Save to Hive
      await StorageService.userBox.put(user.id, user);

      // Set current user session
      await StorageService.setCurrentUserId(user.id);

      return user;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<User?> signIn(String email, String password) async {
    try {
      // Find user by email
      final users = StorageService.userBox.values;
      final user = users.cast<User?>().firstWhere(
        (user) => user?.email.toLowerCase() == email.toLowerCase(),
        orElse: () => null,
      );

      if (user == null) {
        return null;
      }

      // Verify password
      if (!user.verifyPassword(password)) {
        return null;
      }

      // Set current user session
      await StorageService.setCurrentUserId(user.id);

      return user;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> signOut() async {
    await StorageService.clearSession();
  }

  @override
  Future<User?> getCurrentUser() async {
    try {
      final userId = StorageService.getCurrentUserId();
      if (userId == null) {
        return null;
      }

      return StorageService.userBox.get(userId);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> isEmailTaken(String email) async {
    try {
      final users = StorageService.userBox.values;
      return users.any(
        (user) => user.email.toLowerCase() == email.toLowerCase(),
      );
    } catch (e) {
      return false;
    }
  }
}
