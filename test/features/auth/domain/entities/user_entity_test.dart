import 'package:flutter_test/flutter_test.dart';
import 'package:business_code_by_mohamed_salah/features/auth/domain/entities/user_entity.dart';

void main() {
  group('UserEntity', () {
    group('create factory', () {
      test('should create user entity with all fields', () {
        const name = 'John Doe';
        const email = 'john@example.com';
        const password = 'password123';

        final userEntity = UserEntity.create(
          name: name,
          email: email,
          password: password,
        );

        expect(userEntity.name, equals(name));
        expect(userEntity.email, equals(email.toLowerCase()));
        expect(userEntity.id, isNotEmpty);
        expect(userEntity.createdAt, isNotNull);
      });

      test('should convert email to lowercase', () {
        const name = 'John Doe';
        const email = 'JOHN@EXAMPLE.COM';
        const password = 'password123';

        final userEntity = UserEntity.create(
          name: name,
          email: email,
          password: password,
        );

        expect(userEntity.email, equals('john@example.com'));
      });

      test('should generate unique IDs for different users', () {
        final user1 = UserEntity.create(
          name: 'John Doe',
          email: 'john@example.com',
          password: 'password123',
        );

        final user2 = UserEntity.create(
          name: 'Jane Doe',
          email: 'jane@example.com',
          password: 'password456',
        );

        expect(user1.id, isNot(equals(user2.id)));
      });
    });

    group('equality', () {
      test('should be equal when all fields are the same', () {
        final now = DateTime.now();
        const id = 'test-id';

        final user1 = UserEntity(
          id: id,
          name: 'John Doe',
          email: 'john@example.com',
          createdAt: now,
        );

        final user2 = UserEntity(
          id: id,
          name: 'John Doe',
          email: 'john@example.com',
          createdAt: now,
        );

        expect(user1, equals(user2));
        expect(user1.hashCode, equals(user2.hashCode));
      });

      test('should not be equal when IDs are different', () {
        final now = DateTime.now();

        final user1 = UserEntity(
          id: 'id-1',
          name: 'John Doe',
          email: 'john@example.com',
          createdAt: now,
        );

        final user2 = UserEntity(
          id: 'id-2',
          name: 'John Doe',
          email: 'john@example.com',
          createdAt: now,
        );

        expect(user1, isNot(equals(user2)));
      });

      test('should not be equal when names are different', () {
        final now = DateTime.now();
        const id = 'test-id';

        final user1 = UserEntity(
          id: id,
          name: 'John Doe',
          email: 'john@example.com',
          createdAt: now,
        );

        final user2 = UserEntity(
          id: id,
          name: 'Jane Doe',
          email: 'john@example.com',
          createdAt: now,
        );

        expect(user1, isNot(equals(user2)));
      });
    });

    group('toString', () {
      test('should return formatted string representation', () {
        final user = UserEntity.create(
          name: 'John Doe',
          email: 'john@example.com',
          password: 'password123',
        );

        final result = user.toString();

        expect(result, contains('UserEntity('));
        expect(result, contains('id: ${user.id}'));
        expect(result, contains('name: ${user.name}'));
        expect(result, contains('email: ${user.email}'));
        expect(result, contains('createdAt: ${user.createdAt}'));
      });
    });
  });
}
