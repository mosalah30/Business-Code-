import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// -------------------- MODEL --------------------
class BusinessCardModel {
  final String name;
  final String title;
  final String location;
  final String email;
  final String website;
  final String avatarUrl; // optional
  final List<IconData> socialIcons;

  BusinessCardModel({
    required this.name,
    required this.title,
    required this.location,
    required this.email,
    required this.website,
    required this.avatarUrl,
    required this.socialIcons,
  });
}

// -------------------- DUMMY DATA --------------------
final List<BusinessCardModel> businessCards = [
  BusinessCardModel(
    name: "محمد علي",
    title: "مهندس تجربة مستخدم",
    location: "الدمام، السعودية",
    email: "mohammedali@gmail.com",
    website: "https://mohammedali.com",
    avatarUrl: "https://i.pravatar.cc/150?img=3",
    socialIcons: [
      FontAwesomeIcons.linkedin,
      FontAwesomeIcons.github,
      FontAwesomeIcons.twitter,
    ],
  ),
  BusinessCardModel(
    name: "أحمد حسن",
    title: "مطور تطبيقات Flutter",
    location: "القاهرة، مصر",
    email: "ahmedhassan@gmail.com",
    website: "https://ahmeddev.com",
    avatarUrl: "https://i.pravatar.cc/150?img=5",
    socialIcons: [
      FontAwesomeIcons.linkedin,
      FontAwesomeIcons.instagram,
      FontAwesomeIcons.github,
    ],
  ),
  BusinessCardModel(
    name: "سارة عبد الله",
    title: "مصممة UI/UX",
    location: "جدة، السعودية",
    email: "saraabdullah@gmail.com",
    website: "https://sara-designs.com",
    avatarUrl: "https://i.pravatar.cc/150?img=6",
    socialIcons: [
      FontAwesomeIcons.behance,
      FontAwesomeIcons.dribbble,
      FontAwesomeIcons.linkedin,
    ],
  ),
];

// -------------------- MAIN UI --------------------
class BusinessCardListPage extends StatelessWidget {
  const BusinessCardListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('بطاقات الأعمال'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: businessCards.length,
        itemBuilder: (context, index) {
          final card = businessCards[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: BusinessCardWidget(card: card),
          );
        },
      ),
    );
  }
}

// -------------------- CARD WIDGET --------------------
class BusinessCardWidget extends StatelessWidget {
  final BusinessCardModel card;
  const BusinessCardWidget({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage(card.avatarUrl),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        card.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        card.title,
                        style: const TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.location_on_outlined, size: 18, color: Colors.grey),
                const SizedBox(width: 8),
                Text(card.location),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.email_outlined, size: 18, color: Colors.grey),
                const SizedBox(width: 8),
                Text(card.email, style: const TextStyle(color: Colors.blue)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.language_outlined, size: 18, color: Colors.grey),
                const SizedBox(width: 8),
                Text(card.website, style: const TextStyle(color: Colors.blue)),
              ],
            ),
            const SizedBox(height: 12),
            const Divider(),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: card.socialIcons
                  .map((icon) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: FaIcon(icon, size: 20, color: Colors.grey[800]),
              ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
