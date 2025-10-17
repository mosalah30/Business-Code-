import 'package:flutter_test/flutter_test.dart';
import 'package:business_code_by_mohamed_salah/features/auth/data/mappers/user_mapper.dart';
import 'package:business_code_by_mohamed_salah/features/auth/domain/entities/user_entity.dart';
import 'package:business_code_by_mohamed_salah/features/auth/data/models/user.dart';

void main() {
  group('UserMapper', () {
    group('toEntity', () {
      test('should convert User model to UserEntity', () {
        final userModel = User.create(
          name: 'John Doe',
          email: 'john@example.com',
          password: 'password123',
        );

        final userEntity = UserMapper.toEntity(userModel);

        expect(userEntity.id, equals(userModel.id));
        expect(userEntity.name, equals(userModel.name));
        expect(userEntity.email, equals(userModel.email));
        expect(userEntity.createdAt, equals(userModel.createdAt));
      });

      test('should preserve all fields during conversion', () {
        final now = DateTime.now();
        final userModel = User(
          id: 'test-id',
          name: 'John Doe',
          email: 'john@example.com',
          hashedPassword: 'hashed-password',
          createdAt: now,
        );

        final userEntity = UserMapper.toEntity(userModel);

        expect(userEntity.id, equals('test-id'));
        expect(userEntity.name, equals('John Doe'));
        expect(userEntity.email, equals('john@example.com'));
        expect(userEntity.createdAt, equals(now));
      });
    });

    group('toModel', () {
      test('should convert UserEntity to User model', () {
        final userEntity = UserEntity.create(
          name: 'John Doe',
          email: 'john@example.com',
          password: 'password123',
        );
        const hashedPassword = 'hashed-password-123';

        final userModel = UserMapper.toModel(userEntity, hashedPassword);

        expect(userModel.id, equals(userEntity.id));
        expect(userModel.name, equals(userEntity.name));
        expect(userModel.email, equals(userEntity.email));
        expect(userModel.hashedPassword, equals(hashedPassword));
        expect(userModel.createdAt, equals(userEntity.createdAt));
      });

      test('should use provided hashed password', () {
        final userEntity = UserEntity(
          id: 'test-id',
          name: 'John Doe',
          email: 'john@example.com',
          createdAt: DateTime.now(),
        );
        const hashedPassword = 'custom-hashed-password';

        final userModel = UserMapper.toModel(userEntity, hashedPassword);

        expect(userModel.hashedPassword, equals(hashedPassword));
      });
    });

    group('round-trip conversion', () {
      test('should maintain data integrity through round-trip conversion', () {
        final originalModel = User.create(
          name: 'John Doe',
          email: 'john@example.com',
          password: 'password123',
        );

        final entity = UserMapper.toEntity(originalModel);
        final convertedModel = UserMapper.toModel(
          entity,
          originalModel.hashedPassword,
        );

        expect(convertedModel.id, equals(originalModel.id));
        expect(convertedModel.name, equals(originalModel.name));
        expect(convertedModel.email, equals(originalModel.email));
        expect(
          convertedModel.hashedPassword,
          equals(originalModel.hashedPassword),
        );
        expect(convertedModel.createdAt, equals(originalModel.createdAt));
      });
    });
  });
}
