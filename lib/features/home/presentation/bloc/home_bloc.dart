import 'package:business_code_by_mohamed_salah/features/auth/presentation/login/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<ChangeLanguageEvent>(_onChangeLanguage);
    // on<SignUpEvent>(_onSignUp);
    // on<SignInEvent>(_onSignIn);
    // on<SignOutEvent>(_onSignOut);
  }

  //
  Future<void> _onChangeLanguage(ChangeLanguageEvent event, Emitter<HomeState> emit) async {
    emit(HomeInitial());
    emit(HomeLanguageChanged());
  }

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
