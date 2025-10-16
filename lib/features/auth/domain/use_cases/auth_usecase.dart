import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/models/use_case.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';


class SignUpUseCase extends UseCase<UserEntity, SignUpParams> {
  final AuthRepository _authRepository;

  SignUpUseCase( AuthRepository authRepository) : _authRepository = authRepository;

  @override
  Future<Either<Failure, UserEntity>> call(SignUpParams params)  {
    return  _authRepository.signUp(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class SignUpParams extends Equatable {
  final String name;
  final String email;
  final String password;

  const SignUpParams({
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [name, email, password];
}

class SignInUseCase extends UseCase<UserEntity, SignInParams> {
  final AuthRepository _authRepository;

  SignInUseCase( AuthRepository authRepository) : _authRepository = authRepository;

  @override
  Future<Either<Failure, UserEntity>> call(SignInParams params) async {
    return await _authRepository.signIn(email: params.email, password: params.password);
  }
}

class SignOutUseCase extends UseCase<void, NoParams> {
  final AuthRepository _authRepository;

  SignOutUseCase( AuthRepository authRepository) : _authRepository = authRepository;

  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return _authRepository.signOut();
  }
}

class SignInParams extends Equatable {
  final String email;
  final String password;

  const SignInParams({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
