import 'package:hive/hive.dart';
part 'business_card.g.dart'; // 👈 this is critical

@HiveType(typeId: 1)
class BusinessCard extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String userId;

  @HiveField(2)
  final String name;

  @HiveField(3)
  final String title;

  @HiveField(4)
  final String location;

  @HiveField(5)
  final String email;

  @HiveField(6)
  final String website;

  @HiveField(7)
  final String avatarUrl;


  BusinessCard({
    required this.id,
    required this.userId,
    required this.name,
    required this.title,
    required this.location,
    required this.email,
    required this.website,
    required this.avatarUrl,
  });
}
