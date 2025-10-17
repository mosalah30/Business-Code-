import 'package:flutter_test/flutter_test.dart';
import 'package:business_code_by_mohamed_salah/features/auth/data/models/user.dart';

void main() {
  group('User Model', () {
    group('create factory', () {
      test('should create user with hashed password', () {
        const name = 'John Doe';
        const email = 'john@example.com';
        const password = 'password123';

        final user = User.create(name: name, email: email, password: password);

        expect(user.name, equals(name));
        expect(user.email, equals(email.toLowerCase()));
        expect(user.hashedPassword, isNot(equals(password)));
        expect(user.hashedPassword.length, greaterThan(0));
        expect(user.id, isNotEmpty);
        expect(user.createdAt, isNotNull);
      });

      test('should convert email to lowercase', () {
        const name = 'John Doe';
        const email = 'JOHN@EXAMPLE.COM';
        const password = 'password123';

        final user = User.create(name: name, email: email, password: password);

        expect(user.email, equals('john@example.com'));
      });

      test('should generate unique IDs for different users', () {
        final user1 = User.create(
          name: 'John Doe',
          email: 'john@example.com',
          password: 'password123',
        );

        final user2 = User.create(
          name: 'Jane Doe',
          email: 'jane@example.com',
          password: 'password456',
        );

        expect(user1.id, isNot(equals(user2.id)));
      });
    });

    group('verifyPassword', () {
      test('should return true for correct password', () {
        const password = 'password123';
        final user = User.create(
          name: 'John Doe',
          email: 'john@example.com',
          password: password,
        );

        expect(user.verifyPassword(password), isTrue);
      });

      test('should return false for incorrect password', () {
        const password = 'password123';
        const wrongPassword = 'wrongpassword';
        final user = User.create(
          name: 'John Doe',
          email: 'john@example.com',
          password: password,
        );

        expect(user.verifyPassword(wrongPassword), isFalse);
      });

      test('should be case sensitive', () {
        const password = 'password123';
        const wrongCasePassword = 'PASSWORD123';
        final user = User.create(
          name: 'John Doe',
          email: 'john@example.com',
          password: password,
        );

        expect(user.verifyPassword(wrongCasePassword), isFalse);
      });
    });

    group('copyWith', () {
      test('should create new user with updated name', () {
        final originalUser = User.create(
          name: 'John Doe',
          email: 'john@example.com',
          password: 'password123',
        );

        final updatedUser = originalUser.copyWith(name: 'Jane Doe');

        expect(updatedUser.name, equals('Jane Doe'));
        expect(updatedUser.email, equals(originalUser.email));
        expect(updatedUser.id, equals(originalUser.id));
        expect(updatedUser.hashedPassword, equals(originalUser.hashedPassword));
        expect(updatedUser.createdAt, equals(originalUser.createdAt));
      });

      test('should create new user with updated email', () {
        final originalUser = User.create(
          name: 'John Doe',
          email: 'john@example.com',
          password: 'password123',
        );

        final updatedUser = originalUser.copyWith(
          email: 'newemail@example.com',
        );

        expect(updatedUser.email, equals('newemail@example.com'));
        expect(updatedUser.name, equals(originalUser.name));
        expect(updatedUser.id, equals(originalUser.id));
      });

      test('should keep original values when no parameters provided', () {
        final originalUser = User.create(
          name: 'John Doe',
          email: 'john@example.com',
          password: 'password123',
        );

        final copiedUser = originalUser.copyWith();

        expect(copiedUser.name, equals(originalUser.name));
        expect(copiedUser.email, equals(originalUser.email));
        expect(copiedUser.id, equals(originalUser.id));
        expect(copiedUser.hashedPassword, equals(originalUser.hashedPassword));
        expect(copiedUser.createdAt, equals(originalUser.createdAt));
      });
    });

    group('toString', () {
      test('should return formatted string representation', () {
        final user = User.create(
          name: 'John Doe',
          email: 'john@example.com',
          password: 'password123',
        );

        final result = user.toString();

        expect(result, contains('User('));
        expect(result, contains('id: ${user.id}'));
        expect(result, contains('name: ${user.name}'));
        expect(result, contains('email: ${user.email}'));
        expect(result, contains('createdAt: ${user.createdAt}'));
      });
    });
  });
}
