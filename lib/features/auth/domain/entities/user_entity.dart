import 'package:uuid/uuid.dart';

class UserEntity {
  final String id;
  final String name;
  final String email;
  final DateTime createdAt;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.createdAt,
  });

  factory UserEntity.create({
    required String name,
    required String email,
    required String password,
  }) {
    return UserEntity(
      id: const Uuid().v4(),
      name: name,
      email: email.toLowerCase(),
      createdAt: DateTime.now(),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserEntity &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ email.hashCode ^ createdAt.hashCode;
  }

  @override
  String toString() {
    return 'UserEntity(id: $id, name: $name, email: $email, createdAt: $createdAt)';
  }
}
