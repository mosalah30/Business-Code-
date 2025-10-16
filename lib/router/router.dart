import 'package:business_code_by_mohamed_salah/features/auth/presentation/sign_in/bloc/sign_in_bloc.dart';
import 'package:business_code_by_mohamed_salah/features/auth/presentation/sign_up/bloc/sign_up_bloc.dart';
import 'package:business_code_by_mohamed_salah/features/home/presentation/bloc/home_bloc.dart';
import 'package:business_code_by_mohamed_salah/features/home/presentation/view/home_screen.dart';
import 'package:business_code_by_mohamed_salah/features/home/presentation/view/privacy_policy_screen.dart';
import 'package:business_code_by_mohamed_salah/router/routes_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../core/services/service_locator.dart';
import '../features/auth/domain/use_cases/auth_usecase.dart';
import '../features/auth/presentation/sign_in/view/sign_in_screen.dart';
import '../features/auth/presentation/sign_up/view/sign_up_screen.dart';
import '../features/auth/presentation/splash/splash_screen.dart';
import '../features/home/domain/usecase/home_use_case.dart';

class AppRouter {
  static GoRoute _homePageRouteBuilder() => GoRoute(
    path: RoutesConstants.homeRoute,
    pageBuilder: (context, state) => buildPageWithDefaultTransition(
      context: context,
      state: state,
      child: BlocProvider(
        create: (_) => HomeBloc(
          getBusinessCard: sl<GetBusinessCardUseCase>(),
          deleteBusinessCard: sl<DeleteBusinessCardUseCase>(),
          saveBusinessCard: sl<SaveBusinessCardUseCase>(),
        ),
        child: const HomeScreen(),
      ),
    ),
  );

  static GoRoute _splashPageRouteBuilder() {
    return GoRoute(
      path: RoutesConstants.splashRoute,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    );
  }

  static GoRoute _privacyPolicyRPageRouteBuilder() {
    return GoRoute(
      path: RoutesConstants.privacyPolicyRoute,
      builder: (BuildContext context, GoRouterState state) {
        return const PrivacyPolicyScreen();
      },
    );
  }

  static GoRoute _signUpPageRouteBuilder() {
    return GoRoute(
      path: RoutesConstants.signUpRoute,
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (BuildContext context) => SignUpBloc(signUpUseCase: sl<SignUpUseCase>()),
          child: const SignUpScreen(),
        );
      },
    );
  }

  static GoRoute _signInPageRouteBuilder() {
    return GoRoute(
      path: RoutesConstants.signInRoute,
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (BuildContext context) =>
              SignInBloc(signInUseCase: sl<SignInUseCase>(), signOutUseCase: sl<SignOutUseCase>()),
          child: const SignInScreen(),
        );
      },
    );
  }

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      _splashPageRouteBuilder(),
      _privacyPolicyRPageRouteBuilder(),
      _homePageRouteBuilder(),
      _signUpPageRouteBuilder(),
      _signInPageRouteBuilder(),
    ],
  );

  static CustomTransitionPage buildPageWithDefaultTransition<T>({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage<T>(
      transitionDuration: Duration(milliseconds: 700),
      reverseTransitionDuration: Duration(milliseconds: 700),
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}
