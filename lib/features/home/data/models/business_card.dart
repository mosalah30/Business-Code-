import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'business_card.g.dart';

@HiveType(typeId: 1)
class BusinessCard extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String company;

  @HiveField(3)
  String phone;

  @HiveField(4)
  String email;

  @HiveField(5)
  String address;

  @HiveField(6)
  String? imageUrl;

  @HiveField(7)
  DateTime createdAt;

  @HiveField(8)
  DateTime updatedAt;

  @HiveField(9)
  String userId;

  BusinessCard({
    required this.id,
    required this.name,
    required this.company,
    required this.phone,
    required this.email,
    required this.address,
    this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
  });

  factory BusinessCard.create({
    required String name,
    required String company,
    required String phone,
    required String email,
    required String address,
    required String userId,
    String? imageUrl,
  }) {
    final now = DateTime.now();
    return BusinessCard(
      id: const Uuid().v4(),
      name: name,
      company: company,
      phone: phone,
      email: email,
      address: address,
      imageUrl: imageUrl,
      createdAt: now,
      updatedAt: now,
      userId: userId,
    );
  }

  BusinessCard copyWith({
    String? name,
    String? company,
    String? phone,
    String? email,
    String? address,
    String? imageUrl,
    String? userId,
  }) {
    return BusinessCard(
      id: id,
      name: name ?? this.name,
      company: company ?? this.company,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      address: address ?? this.address,
      imageUrl: imageUrl ?? this.imageUrl,
      createdAt: createdAt,
      updatedAt: DateTime.now(),
      userId: userId ?? this.userId,
    );
  }

  bool isValid() {
    return name.isNotEmpty &&
        company.isNotEmpty &&
        (phone.isNotEmpty || email.isNotEmpty);
  }

  @override
  String toString() {
    return 'BusinessCard(id: $id, name: $name, company: $company, phone: $phone, email: $email)';
  }
}
