import 'package:flutter_test/flutter_test.dart';
import 'package:business_code_by_mohamed_salah/features/home/data/models/business_card.dart';

void main() {
  group('BusinessCard Model', () {
    group('constructor', () {
      test('should create business card with all fields', () {
        const id = 'card-123';
        const userId = 'user-123';
        const name = 'John Doe';
        const title = 'Software Engineer';
        const location = 'San Francisco, CA';
        const email = 'john@techcorp.com';
        const website = 'https://johndoe.com';
        const avatarUrl = 'https://example.com/avatar.jpg';

        final card = BusinessCard(
          id: id,
          userId: userId,
          name: name,
          title: title,
          location: location,
          email: email,
          website: website,
          avatarUrl: avatarUrl,
        );

        expect(card.id, equals(id));
        expect(card.userId, equals(userId));
        expect(card.name, equals(name));
        expect(card.title, equals(title));
        expect(card.location, equals(location));
        expect(card.email, equals(email));
        expect(card.website, equals(website));
        expect(card.avatarUrl, equals(avatarUrl));
      });

      test('should create multiple cards with different data', () {
        final card1 = BusinessCard(
          id: 'card-1',
          userId: 'user-123',
          name: 'John Doe',
          title: 'Software Engineer',
          location: 'San Francisco, CA',
          email: 'john@techcorp.com',
          website: 'https://johndoe.com',
          avatarUrl: 'https://example.com/avatar1.jpg',
        );

        final card2 = BusinessCard(
          id: 'card-2',
          userId: 'user-123',
          name: 'Jane Smith',
          title: 'Product Manager',
          location: 'New York, NY',
          email: 'jane@design.com',
          website: 'https://janesmith.com',
          avatarUrl: 'https://example.com/avatar2.jpg',
        );

        expect(card1.id, isNot(equals(card2.id)));
        expect(card1.name, isNot(equals(card2.name)));
        expect(card1.email, isNot(equals(card2.email)));
      });
    });

    group('field validation', () {
      test('should have all required fields', () {
        final card = BusinessCard(
          id: 'card-123',
          userId: 'user-123',
          name: 'John Doe',
          title: 'Software Engineer',
          location: 'San Francisco, CA',
          email: 'john@techcorp.com',
          website: 'https://johndoe.com',
          avatarUrl: 'https://example.com/avatar.jpg',
        );

        expect(card.id, isNotEmpty);
        expect(card.userId, isNotEmpty);
        expect(card.name, isNotEmpty);
        expect(card.title, isNotEmpty);
        expect(card.location, isNotEmpty);
        expect(card.email, isNotEmpty);
        expect(card.website, isNotEmpty);
        expect(card.avatarUrl, isNotEmpty);
      });

      test('should allow empty strings for optional-like fields', () {
        final card = BusinessCard(
          id: 'card-123',
          userId: 'user-123',
          name: 'John Doe',
          title: '',
          location: '',
          email: 'john@techcorp.com',
          website: '',
          avatarUrl: '',
        );

        expect(card.title, isEmpty);
        expect(card.location, isEmpty);
        expect(card.website, isEmpty);
        expect(card.avatarUrl, isEmpty);
      });
    });

    group('userId association', () {
      test('should associate card with correct user', () {
        const userId = 'user-123';
        final card = BusinessCard(
          id: 'card-123',
          userId: userId,
          name: 'John Doe',
          title: 'Software Engineer',
          location: 'San Francisco, CA',
          email: 'john@techcorp.com',
          website: 'https://johndoe.com',
          avatarUrl: 'https://example.com/avatar.jpg',
        );

        expect(card.userId, equals(userId));
      });

      test('should allow multiple cards for same user', () {
        const userId = 'user-123';

        final card1 = BusinessCard(
          id: 'card-1',
          userId: userId,
          name: 'John Doe',
          title: 'Software Engineer',
          location: 'San Francisco, CA',
          email: 'john@techcorp.com',
          website: 'https://johndoe.com',
          avatarUrl: 'https://example.com/avatar1.jpg',
        );

        final card2 = BusinessCard(
          id: 'card-2',
          userId: userId,
          name: 'Jane Smith',
          title: 'Product Manager',
          location: 'New York, NY',
          email: 'jane@design.com',
          website: 'https://janesmith.com',
          avatarUrl: 'https://example.com/avatar2.jpg',
        );

        expect(card1.userId, equals(card2.userId));
        expect(card1.id, isNot(equals(card2.id)));
      });
    });

    group('data integrity', () {
      test('should maintain field values after creation', () {
        const id = 'card-123';
        const userId = 'user-123';
        const name = 'John Doe';
        const title = 'Software Engineer';
        const location = 'San Francisco, CA';
        const email = 'john@techcorp.com';
        const website = 'https://johndoe.com';
        const avatarUrl = 'https://example.com/avatar.jpg';

        final card = BusinessCard(
          id: id,
          userId: userId,
          name: name,
          title: title,
          location: location,
          email: email,
          website: website,
          avatarUrl: avatarUrl,
        );

        // Verify all fields remain unchanged
        expect(card.id, equals(id));
        expect(card.userId, equals(userId));
        expect(card.name, equals(name));
        expect(card.title, equals(title));
        expect(card.location, equals(location));
        expect(card.email, equals(email));
        expect(card.website, equals(website));
        expect(card.avatarUrl, equals(avatarUrl));
      });
    });
  });
}
