import 'package:business_code_by_mohamed_salah/features/auth/presentation/login/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/repositories/auth_repository.dart';

class LoginBloc extends Bloc<LoginBloc, LoginState> {
  final AuthRepository _authRepository;

  LoginBloc(this._authRepository) : super(LoginInitial()) {
    // on<CheckAuthEvent>(_onCheckAuth);
    // on<SignUpEvent>(_onSignUp);
    // on<SignInEvent>(_onSignIn);
    // on<SignOutEvent>(_onSignOut);
  }
  //
  // Future<void> _onCheckAuth(
  //   CheckAuthEvent event,
  //   Emitter<AuthState> emit,
  // ) async {
  //   emit(AuthLoading());
  //
  //   try {
  //     final user = await _authRepository.getCurrentUser();
  //     if (user != null) {
  //       emit(AuthSuccess(user));
  //     } else {
  //       emit(AuthUnauthenticated());
  //     }
  //   } catch (e) {
  //     emit(AuthUnauthenticated());
  //   }
  // }
  //
  // Future<void> _onSignUp(SignUpEvent event, Emitter<AuthState> emit) async {
  //   emit(AuthLoading());
  //
  //   try {
  //     final user = await _authRepository.signUp(
  //       event.name,
  //       event.email,
  //       event.password,
  //     );
  //
  //     if (user != null) {
  //       emit(AuthSuccess(user));
  //     } else {
  //       emit(const AuthError('Email already exists or registration failed'));
  //     }
  //   } catch (e) {
  //     emit(const AuthError('Registration failed. Please try again.'));
  //   }
  // }
  //
  // Future<void> _onSignIn(SignInEvent event, Emitter<AuthState> emit) async {
  //   emit(AuthLoading());
  //
  //   try {
  //     final user = await _authRepository.signIn(event.email, event.password);
  //
  //     if (user != null) {
  //       emit(AuthSuccess(user));
  //     } else {
  //       emit(const AuthError('Invalid email or password'));
  //     }
  //   } catch (e) {
  //     emit(const AuthError('Sign in failed. Please try again.'));
  //   }
  // }
  //
  // Future<void> _onSignOut(SignOutEvent event, Emitter<AuthState> emit) async {
  //   try {
  //     await _authRepository.signOut();
  //     emit(AuthUnauthenticated());
  //   } catch (e) {
  //     emit(const AuthError('Sign out failed. Please try again.'));
  //   }
  // }
}
