import '../../domain/entities/user_entity.dart';
import '../models/user.dart';

class UserMapper {
  static UserEntity toEntity(User user) {
    return UserEntity(
      id: user.id,
      name: user.name,
      email: user.email,
      createdAt: user.createdAt,
    );
  }

  static User toModel(UserEntity entity, String hashedPassword) {
    return User(
      id: entity.id,
      name: entity.name,
      email: entity.email,
      hashedPassword: hashedPassword,
      createdAt: entity.createdAt,
    );
  }
}
