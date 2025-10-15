import 'package:flutter/material.dart';
class BusinessCardEntity {
  final String name;
  final String title;
  final String location;
  final String email;
  final String website;
  final String avatarUrl; // optional
  final List<IconData> socialIcons;

  BusinessCardEntity({
    required this.name,
    required this.title,
    required this.location,
    required this.email,
    required this.website,
    required this.avatarUrl,
    required this.socialIcons,
  });
}
