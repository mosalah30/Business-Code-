import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:business_code_by_mohamed_salah/features/home/data/models/user.dart';
import 'package:business_code_by_mohamed_salah/features/home/domain/repositories/auth_repository.dart';
import 'package:business_code_by_mohamed_salah/features/home/presentation/blocs/auth/auth_bloc.dart';
import 'package:business_code_by_mohamed_salah/features/home/presentation/blocs/auth/auth_event.dart';
import 'package:business_code_by_mohamed_salah/features/home/presentation/blocs/auth/auth_state.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  group('AuthBloc', () {
    late AuthBloc authBloc;
    late MockAuthRepository mockAuthRepository;
    late User testUser;

    setUp(() {
      mockAuthRepository = MockAuthRepository();
      authBloc = AuthBloc(mockAuthRepository);
      testUser = User.create(
        name: 'John Doe',
        email: 'john@example.com',
        password: 'password123',
      );
    });

    tearDown(() {
      authBloc.close();
    });

    test('initial state is AuthInitial', () {
      expect(authBloc.state, equals(AuthInitial()));
    });

    group('CheckAuthEvent', () {
      blocTest<AuthBloc, AuthState>(
        'emits [AuthLoading, AuthSuccess] when user is logged in',
        build: () {
          when(
            () => mockAuthRepository.getCurrentUser(),
          ).thenAnswer((_) async => testUser);
          return authBloc;
        },
        act: (bloc) => bloc.add(CheckAuthEvent()),
        expect: () => [AuthLoading(), AuthSuccess(testUser)],
        verify: (_) {
          verify(() => mockAuthRepository.getCurrentUser()).called(1);
        },
      );

      blocTest<AuthBloc, AuthState>(
        'emits [AuthLoading, AuthUnauthenticated] when no user is logged in',
        build: () {
          when(
            () => mockAuthRepository.getCurrentUser(),
          ).thenAnswer((_) async => null);
          return authBloc;
        },
        act: (bloc) => bloc.add(CheckAuthEvent()),
        expect: () => [AuthLoading(), AuthUnauthenticated()],
        verify: (_) {
          verify(() => mockAuthRepository.getCurrentUser()).called(1);
        },
      );

      blocTest<AuthBloc, AuthState>(
        'emits [AuthLoading, AuthUnauthenticated] when getCurrentUser throws',
        build: () {
          when(
            () => mockAuthRepository.getCurrentUser(),
          ).thenThrow(Exception('Storage error'));
          return authBloc;
        },
        act: (bloc) => bloc.add(CheckAuthEvent()),
        expect: () => [AuthLoading(), AuthUnauthenticated()],
        verify: (_) {
          verify(() => mockAuthRepository.getCurrentUser()).called(1);
        },
      );
    });

    group('SignUpEvent', () {
      const signUpEvent = SignUpEvent(
        name: 'John Doe',
        email: 'john@example.com',
        password: 'password123',
      );

      blocTest<AuthBloc, AuthState>(
        'emits [AuthLoading, AuthSuccess] when sign up is successful',
        build: () {
          when(
            () => mockAuthRepository.signUp(
              signUpEvent.name,
              signUpEvent.email,
              signUpEvent.password,
            ),
          ).thenAnswer((_) async => testUser);
          return authBloc;
        },
        act: (bloc) => bloc.add(signUpEvent),
        expect: () => [AuthLoading(), AuthSuccess(testUser)],
        verify: (_) {
          verify(
            () => mockAuthRepository.signUp(
              signUpEvent.name,
              signUpEvent.email,
              signUpEvent.password,
            ),
          ).called(1);
        },
      );

      blocTest<AuthBloc, AuthState>(
        'emits [AuthLoading, AuthError] when sign up fails',
        build: () {
          when(
            () => mockAuthRepository.signUp(
              signUpEvent.name,
              signUpEvent.email,
              signUpEvent.password,
            ),
          ).thenAnswer((_) async => null);
          return authBloc;
        },
        act: (bloc) => bloc.add(signUpEvent),
        expect: () => [
          AuthLoading(),
          const AuthError('Email already exists or registration failed'),
        ],
        verify: (_) {
          verify(
            () => mockAuthRepository.signUp(
              signUpEvent.name,
              signUpEvent.email,
              signUpEvent.password,
            ),
          ).called(1);
        },
      );

      blocTest<AuthBloc, AuthState>(
        'emits [AuthLoading, AuthError] when sign up throws exception',
        build: () {
          when(
            () => mockAuthRepository.signUp(
              signUpEvent.name,
              signUpEvent.email,
              signUpEvent.password,
            ),
          ).thenThrow(Exception('Network error'));
          return authBloc;
        },
        act: (bloc) => bloc.add(signUpEvent),
        expect: () => [
          AuthLoading(),
          const AuthError('Registration failed. Please try again.'),
        ],
        verify: (_) {
          verify(
            () => mockAuthRepository.signUp(
              signUpEvent.name,
              signUpEvent.email,
              signUpEvent.password,
            ),
          ).called(1);
        },
      );
    });

    group('SignInEvent', () {
      const signInEvent = SignInEvent(
        email: 'john@example.com',
        password: 'password123',
      );

      blocTest<AuthBloc, AuthState>(
        'emits [AuthLoading, AuthSuccess] when sign in is successful',
        build: () {
          when(
            () => mockAuthRepository.signIn(
              signInEvent.email,
              signInEvent.password,
            ),
          ).thenAnswer((_) async => testUser);
          return authBloc;
        },
        act: (bloc) => bloc.add(signInEvent),
        expect: () => [AuthLoading(), AuthSuccess(testUser)],
        verify: (_) {
          verify(
            () => mockAuthRepository.signIn(
              signInEvent.email,
              signInEvent.password,
            ),
          ).called(1);
        },
      );

      blocTest<AuthBloc, AuthState>(
        'emits [AuthLoading, AuthError] when sign in fails',
        build: () {
          when(
            () => mockAuthRepository.signIn(
              signInEvent.email,
              signInEvent.password,
            ),
          ).thenAnswer((_) async => null);
          return authBloc;
        },
        act: (bloc) => bloc.add(signInEvent),
        expect: () => [
          AuthLoading(),
          const AuthError('Invalid email or password'),
        ],
        verify: (_) {
          verify(
            () => mockAuthRepository.signIn(
              signInEvent.email,
              signInEvent.password,
            ),
          ).called(1);
        },
      );

      blocTest<AuthBloc, AuthState>(
        'emits [AuthLoading, AuthError] when sign in throws exception',
        build: () {
          when(
            () => mockAuthRepository.signIn(
              signInEvent.email,
              signInEvent.password,
            ),
          ).thenThrow(Exception('Network error'));
          return authBloc;
        },
        act: (bloc) => bloc.add(signInEvent),
        expect: () => [
          AuthLoading(),
          const AuthError('Sign in failed. Please try again.'),
        ],
        verify: (_) {
          verify(
            () => mockAuthRepository.signIn(
              signInEvent.email,
              signInEvent.password,
            ),
          ).called(1);
        },
      );
    });

    group('SignOutEvent', () {
      blocTest<AuthBloc, AuthState>(
        'emits [AuthUnauthenticated] when sign out is successful',
        build: () {
          when(() => mockAuthRepository.signOut()).thenAnswer((_) async {});
          return authBloc;
        },
        act: (bloc) => bloc.add(SignOutEvent()),
        expect: () => [AuthUnauthenticated()],
        verify: (_) {
          verify(() => mockAuthRepository.signOut()).called(1);
        },
      );

      blocTest<AuthBloc, AuthState>(
        'emits [AuthError] when sign out throws exception',
        build: () {
          when(
            () => mockAuthRepository.signOut(),
          ).thenThrow(Exception('Storage error'));
          return authBloc;
        },
        act: (bloc) => bloc.add(SignOutEvent()),
        expect: () => [const AuthError('Sign out failed. Please try again.')],
        verify: (_) {
          verify(() => mockAuthRepository.signOut()).called(1);
        },
      );
    });
  });
}
