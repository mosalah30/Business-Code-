import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../domain/entities/business_card_entity.dart';
import '../models/business_card.dart';

class CardMapper {
  /// Converts [BusinessCard] (data model) → [BusinessCardEntity] (domain)
  static BusinessCardEntity toEntity(BusinessCard card) {
    return BusinessCardEntity(
      name: card.name,
      title: card.title,
      location: card.location,
      email: card.email,
      website: card.website,
      avatarUrl: card.avatarUrl,
      socialIcons: [FontAwesomeIcons.linkedin, FontAwesomeIcons.twitter, FontAwesomeIcons.github],
    );
  }

  /// Converts [BusinessCardEntity] (domain) → [BusinessCard] (data model)
  static BusinessCard toModel(BusinessCardEntity entity, String userId) {
    return BusinessCard(
      id: entity.id ?? UniqueKey().toString(),
      // optional safe fallback
      userId: userId,
      name: entity.name,
      title: entity.title,
      location: entity.location,
      email: entity.email,
      website: entity.website,
      avatarUrl: entity.avatarUrl,
    );
  }

  // ------------------------
  // Helper Converters
  // ------------------------
}
