import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/utils/password_helper.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String email;

  @HiveField(3)
  String hashedPassword;

  @HiveField(4)
  DateTime createdAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.hashedPassword,
    required this.createdAt,
  });

  factory User.create({
    required String name,
    required String email,
    required String password,
  }) {
    return User(
      id: const Uuid().v4(),
      name: name,
      email: email.toLowerCase(),
      hashedPassword: PasswordHelper.hashPassword(password),
      createdAt: DateTime.now(),
    );
  }

  bool verifyPassword(String password) {
    return PasswordHelper.verifyPassword(password, hashedPassword);
  }

  User copyWith({String? name, String? email}) {
    return User(
      id: id,
      name: name ?? this.name,
      email: email ?? this.email,
      hashedPassword: hashedPassword,
      createdAt: createdAt,
    );
  }

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, createdAt: $createdAt)';
  }
}
