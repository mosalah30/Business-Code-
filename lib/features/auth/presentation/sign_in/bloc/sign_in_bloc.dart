import 'package:business_code_by_mohamed_salah/core/models/use_case.dart';
import 'package:business_code_by_mohamed_salah/features/auth/presentation/sign_in/bloc/sign_in_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_cases/auth_usecase.dart';
import 'sign_in_event.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInUseCase signInUseCase;
  final SignOutUseCase signOutUseCase;

  SignInBloc({required this.signInUseCase, required this.signOutUseCase}) : super(LoginInitial()) {
    on<SignEvent>(_onSignIn);
    on<SignOutEvent>(_onSignOut);
  }

  Future<void> _onSignIn(SignEvent event, Emitter<SignInState> emit) async {
    emit(LoginLoading());
    await Future.delayed(const Duration(seconds: 3));
    try {
      final either = await signInUseCase.call(SignInParams(email: event.email, password: event.password));
      either.fold((failure) => emit(LoginError(failure.message)), (user) => emit(LoginSuccess(user)));
    } catch (e) {
      emit(const LoginError('sign_in_fail'));
    }
  }

  Future<void> _onSignOut(SignOutEvent event, Emitter<SignInState> emit) async {
    try {
      await signOutUseCase.call(NoParams.instance);
      emit(UnauthenticatedState());
    } catch (e) {
      emit(const LoginError('sign_out_fail'));
    }
  }
}
