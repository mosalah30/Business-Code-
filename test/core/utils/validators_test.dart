import 'package:flutter_test/flutter_test.dart';
import 'package:business_code_by_mohamed_salah/core/utils/validators.dart';

void main() {
  group('Validators', () {
    group('validateEmail', () {
      test('should return null for valid email', () {
        const validEmails = [
          'test@example.com',
          'user.name@domain.co.uk',
          'user123@test-domain.com',
          'john.doe@company.com',
        ];

        for (final email in validEmails) {
          expect(
            Validators.validateEmail(email),
            isNull,
            reason: 'Failed for: $email',
          );
        }
      });

      test('should return error message for invalid email', () {
        const invalidEmails = [
          'invalid-email',
          '@example.com',
          'user@',
          'user@.com',
        ];

        for (final email in invalidEmails) {
          expect(
            Validators.validateEmail(email),
            isNotNull,
            reason: 'Failed for: $email',
          );
        }
      });

      test('should return error message for null or empty email', () {
        expect(Validators.validateEmail(null), equals('Email is required'));
        expect(Validators.validateEmail(''), equals('Email is required'));
      });
    });

    group('validatePassword', () {
      test('should return null for valid password', () {
        const validPasswords = [
          'password123',
          '123456',
          'verylongpassword',
          'P@ssw0rd!',
        ];

        for (final password in validPasswords) {
          expect(
            Validators.validatePassword(password),
            isNull,
            reason: 'Failed for: $password',
          );
        }
      });

      test('should return error message for short password', () {
        const shortPasswords = ['12345', 'abc', 'a'];

        for (final password in shortPasswords) {
          final result = Validators.validatePassword(password);
          expect(result, isNotNull, reason: 'Failed for: $password');
          expect(result, contains('at least 6 characters'));
        }
      });

      test('should return error message for null or empty password', () {
        expect(
          Validators.validatePassword(null),
          equals('Password is required'),
        );
        expect(Validators.validatePassword(''), equals('Password is required'));
      });
    });

    group('validateName', () {
      test('should return null for valid name', () {
        const validNames = [
          'John Doe',
          'Jane',
          'Mary Jane Watson',
          'José María',
        ];

        for (final name in validNames) {
          expect(
            Validators.validateName(name),
            isNull,
            reason: 'Failed for: $name',
          );
        }
      });

      test('should return error message for short name', () {
        const shortNames = ['A', ' ', '  '];

        for (final name in shortNames) {
          final result = Validators.validateName(name);
          expect(result, isNotNull, reason: 'Failed for: $name');
          expect(result, contains('at least 2 characters'));
        }
      });

      test('should return error message for null or empty name', () {
        expect(Validators.validateName(null), equals('Name is required'));
        expect(Validators.validateName(''), equals('Name is required'));
      });
    });

    group('validatePhone', () {
      test('should return null for valid phone numbers', () {
        const validPhones = [
          '+1234567890',
          '123-456-7890',
          '(123) 456-7890',
          '+1 (123) 456-7890',
          '123 456 7890',
          '1234567890',
        ];

        for (final phone in validPhones) {
          expect(
            Validators.validatePhone(phone),
            isNull,
            reason: 'Failed for: $phone',
          );
        }
      });

      test('should return null for null or empty phone (optional field)', () {
        expect(Validators.validatePhone(null), isNull);
        expect(Validators.validatePhone(''), isNull);
      });

      test('should return error message for invalid phone numbers', () {
        const invalidPhones = [
          'abc123',
          '123abc',
          'phone',
          '++123456',
          '123@456',
        ];

        for (final phone in invalidPhones) {
          final result = Validators.validatePhone(phone);
          expect(result, isNotNull, reason: 'Failed for: $phone');
          expect(result, contains('valid phone number'));
        }
      });
    });
  });
}
