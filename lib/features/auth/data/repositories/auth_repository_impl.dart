import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/services/storage_service.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../mappers/user_mapper.dart';
import '../../../home/data/models/user.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<Failure, UserEntity>> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      // Check if email is already taken
      final emailTakenResult = await isEmailTaken(email);
      return emailTakenResult.fold((failure) => Left(failure), (isTaken) async {
        if (isTaken) {
          return Left(AuthFailure('Email already exists'));
        }

        // Create new user model
        final userModel = User.create(
          name: name,
          email: email,
          password: password,
        );

        // Save to storage
        await StorageService.saveUser(userModel);

        // Set current user session
        await StorageService.setCurrentUserId(userModel.id);

        // Convert to entity and return
        final userEntity = UserMapper.toEntity(userModel);
        return Right(userEntity);
      });
    } catch (e) {
      return Left(AuthFailure('Registration failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      // Get user by email
      final userModel = await StorageService.getUserByEmail(email);
      if (userModel == null) {
        return Left(AuthFailure('Invalid email or password'));
      }

      // Verify password
      if (!userModel.verifyPassword(password)) {
        return Left(AuthFailure('Invalid email or password'));
      }

      // Set current user session
      await StorageService.setCurrentUserId(userModel.id);

      // Convert to entity and return
      final userEntity = UserMapper.toEntity(userModel);
      return Right(userEntity);
    } catch (e) {
      return Left(AuthFailure('Sign in failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await StorageService.clearSession();
      return const Right(null);
    } catch (e) {
      return Left(AuthFailure('Sign out failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> getCurrentUser() async {
    try {
      final userId = StorageService.getCurrentUserId();
      if (userId == null) {
        return const Right(null);
      }

      final userModel = await StorageService.getUserById(userId);
      if (userModel == null) {
        return const Right(null);
      }

      // Convert to entity and return
      final userEntity = UserMapper.toEntity(userModel);
      return Right(userEntity);
    } catch (e) {
      return Left(AuthFailure('Failed to get current user: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, bool>> isEmailTaken(String email) async {
    try {
      final exists = await StorageService.isEmailTaken(email);
      return Right(exists);
    } catch (e) {
      return Left(AuthFailure('Failed to check email: ${e.toString()}'));
    }
  }
}
