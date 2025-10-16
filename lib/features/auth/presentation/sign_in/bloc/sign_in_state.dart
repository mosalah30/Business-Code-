import 'package:business_code_by_mohamed_salah/features/auth/domain/entities/user_entity.dart';
import 'package:equatable/equatable.dart';

abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object?> get props => [];
}

class LoginInitial extends SignInState {}

class LoginLoading extends SignInState {}

class LoginSuccess extends SignInState {
  final UserEntity user;

  const LoginSuccess(this.user);

  @override
  List<Object> get props => [user];
}

class LoginError extends SignInState {
  final String message;

  const LoginError(this.message);

  @override
  List<Object> get props => [message];
}

class UnauthenticatedState extends SignInState {}
