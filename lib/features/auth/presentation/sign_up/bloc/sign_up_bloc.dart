import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/user_entity.dart';
import '../../../domain/use_cases/auth_usecase.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUseCase _signUpUseCase;

  SignUpBloc({required SignUpUseCase signUpUseCase}) : _signUpUseCase = signUpUseCase, super(SignUpInitial()) {
    on<SignUpButtonPressed>(_onSignUp);
  }

  Future<void> _onSignUp(SignUpButtonPressed event, Emitter<SignUpState> emit) async {
    emit(SignUpLoading());
   await Future.delayed(const Duration(seconds: 3));
   try {
      final result = await _signUpUseCase(SignUpParams(name: event.name, email: event.email, password: event.password));
      result.fold(
        (failure) => emit(SignUpFailure(message: failure.message)),
        (user) => emit(SignUpSuccess(user: user)),
      );
    } catch (e) {
      emit(const SignUpFailure(message: 'sign_up_fail'));
    }
  }
}
