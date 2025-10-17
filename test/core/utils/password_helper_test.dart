import 'package:flutter_test/flutter_test.dart';
import 'package:business_code_by_mohamed_salah/core/utils/password_helper.dart';

void main() {
  group('PasswordHelper', () {
    group('hashPassword', () {
      test('should return hashed password', () {
        const password = 'password123';
        final hashedPassword = PasswordHelper.hashPassword(password);

        expect(hashedPassword, isNotEmpty);
        expect(hashedPassword, isNot(equals(password)));
        expect(hashedPassword.length, greaterThan(0));
      });

      test('should return different hashes for different passwords', () {
        const password1 = 'password123';
        const password2 = 'differentpassword';

        final hash1 = PasswordHelper.hashPassword(password1);
        final hash2 = PasswordHelper.hashPassword(password2);

        expect(hash1, isNot(equals(hash2)));
      });

      test('should return same hash for same password', () {
        const password = 'password123';

        final hash1 = PasswordHelper.hashPassword(password);
        final hash2 = PasswordHelper.hashPassword(password);

        expect(hash1, equals(hash2));
      });

      test('should be case sensitive', () {
        const password1 = 'password123';
        const password2 = 'PASSWORD123';

        final hash1 = PasswordHelper.hashPassword(password1);
        final hash2 = PasswordHelper.hashPassword(password2);

        expect(hash1, isNot(equals(hash2)));
      });

      test('should handle empty password', () {
        const password = '';
        final hashedPassword = PasswordHelper.hashPassword(password);

        expect(hashedPassword, isNotEmpty);
      });

      test('should handle special characters', () {
        const password = 'p@ssw0rd!#\$%^&*()';
        final hashedPassword = PasswordHelper.hashPassword(password);

        expect(hashedPassword, isNotEmpty);
        expect(hashedPassword, isNot(equals(password)));
      });
    });

    group('verifyPassword', () {
      test('should return true for correct password', () {
        const password = 'password123';
        final hashedPassword = PasswordHelper.hashPassword(password);

        final result = PasswordHelper.verifyPassword(password, hashedPassword);

        expect(result, isTrue);
      });

      test('should return false for incorrect password', () {
        const correctPassword = 'password123';
        const incorrectPassword = 'wrongpassword';
        final hashedPassword = PasswordHelper.hashPassword(correctPassword);

        final result = PasswordHelper.verifyPassword(
          incorrectPassword,
          hashedPassword,
        );

        expect(result, isFalse);
      });

      test('should be case sensitive', () {
        const password = 'password123';
        const wrongCasePassword = 'PASSWORD123';
        final hashedPassword = PasswordHelper.hashPassword(password);

        final result = PasswordHelper.verifyPassword(
          wrongCasePassword,
          hashedPassword,
        );

        expect(result, isFalse);
      });

      test('should return false for empty password against non-empty hash', () {
        const password = 'password123';
        const emptyPassword = '';
        final hashedPassword = PasswordHelper.hashPassword(password);

        final result = PasswordHelper.verifyPassword(
          emptyPassword,
          hashedPassword,
        );

        expect(result, isFalse);
      });

      test(
        'should return true for empty password against empty password hash',
        () {
          const emptyPassword = '';
          final hashedEmptyPassword = PasswordHelper.hashPassword(
            emptyPassword,
          );

          final result = PasswordHelper.verifyPassword(
            emptyPassword,
            hashedEmptyPassword,
          );

          expect(result, isTrue);
        },
      );

      test('should handle special characters correctly', () {
        const password = 'p@ssw0rd!#\$%^&*()';
        final hashedPassword = PasswordHelper.hashPassword(password);

        final result = PasswordHelper.verifyPassword(password, hashedPassword);

        expect(result, isTrue);
      });
    });
  });
}
