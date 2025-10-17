import 'package:flutter_test/flutter_test.dart';
import 'package:business_code_by_mohamed_salah/features/home/data/models/business_card.dart';

void main() {
  group('BusinessCard Model', () {
    group('create factory', () {
      test('should create business card with all fields', () {
        const name = 'John Doe';
        const company = 'Tech Corp';
        const phone = '+1234567890';
        const email = 'john@techcorp.com';
        const address = '123 Tech Street';
        const userId = 'user-123';
        const imageUrl = 'https://example.com/image.jpg';

        final card = BusinessCard.create(
          name: name,
          company: company,
          phone: phone,
          email: email,
          address: address,
          userId: userId,
          imageUrl: imageUrl,
        );

        expect(card.name, equals(name));
        expect(card.company, equals(company));
        expect(card.phone, equals(phone));
        expect(card.email, equals(email));
        expect(card.address, equals(address));
        expect(card.userId, equals(userId));
        expect(card.imageUrl, equals(imageUrl));
        expect(card.id, isNotEmpty);
        expect(card.createdAt, isNotNull);
        expect(card.updatedAt, isNotNull);
        expect(card.createdAt, equals(card.updatedAt));
      });

      test('should create business card without image URL', () {
        const name = 'John Doe';
        const company = 'Tech Corp';
        const phone = '+1234567890';
        const email = 'john@techcorp.com';
        const address = '123 Tech Street';
        const userId = 'user-123';

        final card = BusinessCard.create(
          name: name,
          company: company,
          phone: phone,
          email: email,
          address: address,
          userId: userId,
        );

        expect(card.imageUrl, isNull);
        expect(card.name, equals(name));
        expect(card.company, equals(company));
      });

      test('should generate unique IDs for different cards', () {
        final card1 = BusinessCard.create(
          name: 'John Doe',
          company: 'Tech Corp',
          phone: '+1234567890',
          email: 'john@techcorp.com',
          address: '123 Tech Street',
          userId: 'user-123',
        );

        final card2 = BusinessCard.create(
          name: 'Jane Smith',
          company: 'Design Inc',
          phone: '+0987654321',
          email: 'jane@design.com',
          address: '456 Design Ave',
          userId: 'user-123',
        );

        expect(card1.id, isNot(equals(card2.id)));
      });
    });

    group('copyWith', () {
      late BusinessCard originalCard;

      setUp(() {
        originalCard = BusinessCard.create(
          name: 'John Doe',
          company: 'Tech Corp',
          phone: '+1234567890',
          email: 'john@techcorp.com',
          address: '123 Tech Street',
          userId: 'user-123',
        );
      });

      test('should create new card with updated name', () {
        final updatedCard = originalCard.copyWith(name: 'Jane Doe');

        expect(updatedCard.name, equals('Jane Doe'));
        expect(updatedCard.company, equals(originalCard.company));
        expect(updatedCard.id, equals(originalCard.id));
        expect(updatedCard.createdAt, equals(originalCard.createdAt));
        expect(updatedCard.updatedAt, isNot(equals(originalCard.updatedAt)));
      });

      test('should create new card with updated company', () {
        final updatedCard = originalCard.copyWith(company: 'New Corp');

        expect(updatedCard.company, equals('New Corp'));
        expect(updatedCard.name, equals(originalCard.name));
        expect(updatedCard.id, equals(originalCard.id));
      });

      test('should create new card with updated phone', () {
        final updatedCard = originalCard.copyWith(phone: '+9999999999');

        expect(updatedCard.phone, equals('+9999999999'));
        expect(updatedCard.name, equals(originalCard.name));
      });

      test('should create new card with updated email', () {
        final updatedCard = originalCard.copyWith(email: 'new@example.com');

        expect(updatedCard.email, equals('new@example.com'));
        expect(updatedCard.name, equals(originalCard.name));
      });

      test('should create new card with updated address', () {
        final updatedCard = originalCard.copyWith(address: 'New Address');

        expect(updatedCard.address, equals('New Address'));
        expect(updatedCard.name, equals(originalCard.name));
      });

      test('should create new card with updated userId', () {
        final updatedCard = originalCard.copyWith(userId: 'user-456');

        expect(updatedCard.userId, equals('user-456'));
        expect(updatedCard.name, equals(originalCard.name));
      });

      test('should keep original values when no parameters provided', () {
        final copiedCard = originalCard.copyWith();

        expect(copiedCard.name, equals(originalCard.name));
        expect(copiedCard.company, equals(originalCard.company));
        expect(copiedCard.phone, equals(originalCard.phone));
        expect(copiedCard.email, equals(originalCard.email));
        expect(copiedCard.address, equals(originalCard.address));
        expect(copiedCard.userId, equals(originalCard.userId));
        expect(copiedCard.id, equals(originalCard.id));
        expect(copiedCard.createdAt, equals(originalCard.createdAt));
      });
    });

    group('isValid', () {
      test('should return true for card with name, company, and phone', () {
        final card = BusinessCard.create(
          name: 'John Doe',
          company: 'Tech Corp',
          phone: '+1234567890',
          email: '',
          address: '123 Tech Street',
          userId: 'user-123',
        );

        expect(card.isValid(), isTrue);
      });

      test('should return true for card with name, company, and email', () {
        final card = BusinessCard.create(
          name: 'John Doe',
          company: 'Tech Corp',
          phone: '',
          email: 'john@techcorp.com',
          address: '123 Tech Street',
          userId: 'user-123',
        );

        expect(card.isValid(), isTrue);
      });

      test(
        'should return true for card with name, company, phone, and email',
        () {
          final card = BusinessCard.create(
            name: 'John Doe',
            company: 'Tech Corp',
            phone: '+1234567890',
            email: 'john@techcorp.com',
            address: '123 Tech Street',
            userId: 'user-123',
          );

          expect(card.isValid(), isTrue);
        },
      );

      test('should return false for card without name', () {
        final card = BusinessCard.create(
          name: '',
          company: 'Tech Corp',
          phone: '+1234567890',
          email: 'john@techcorp.com',
          address: '123 Tech Street',
          userId: 'user-123',
        );

        expect(card.isValid(), isFalse);
      });

      test('should return false for card without company', () {
        final card = BusinessCard.create(
          name: 'John Doe',
          company: '',
          phone: '+1234567890',
          email: 'john@techcorp.com',
          address: '123 Tech Street',
          userId: 'user-123',
        );

        expect(card.isValid(), isFalse);
      });

      test('should return false for card without phone and email', () {
        final card = BusinessCard.create(
          name: 'John Doe',
          company: 'Tech Corp',
          phone: '',
          email: '',
          address: '123 Tech Street',
          userId: 'user-123',
        );

        expect(card.isValid(), isFalse);
      });
    });

    group('toString', () {
      test('should return formatted string representation', () {
        final card = BusinessCard.create(
          name: 'John Doe',
          company: 'Tech Corp',
          phone: '+1234567890',
          email: 'john@techcorp.com',
          address: '123 Tech Street',
          userId: 'user-123',
        );

        final result = card.toString();

        expect(result, contains('BusinessCard('));
        expect(result, contains('id: ${card.id}'));
        expect(result, contains('name: ${card.name}'));
        expect(result, contains('company: ${card.company}'));
        expect(result, contains('phone: ${card.phone}'));
        expect(result, contains('email: ${card.email}'));
      });
    });
  });
}
