import 'package:business_code_by_mohamed_salah/features/auth/presentation/login/view/sign_in_screen.dart';
import 'package:business_code_by_mohamed_salah/features/home/presentation/bloc/home_bloc.dart';
import 'package:business_code_by_mohamed_salah/features/home/presentation/view/home_screen.dart';
import 'package:business_code_by_mohamed_salah/router/routes_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../core/services/service_locator.dart';
import '../features/auth/domain/repositories/auth_repository.dart';
import '../features/auth/presentation/login/bloc/login_bloc.dart';
import '../features/auth/presentation/splash/splash_screen.dart';

class AppRouter {
  static GoRoute _loginPageRouteBuilder() => GoRoute(
    path: RoutesConstants.loginRoute,
    builder: (BuildContext context, GoRouterState state) =>
        BlocProvider(create: (_) => LoginBloc(sl<AuthRepository>()), child: LoginScreen()),
  );

  static GoRoute _homePageRouteBuilder() => GoRoute(
    path: RoutesConstants.homeRoute,
    pageBuilder: (context, state) => buildPageWithDefaultTransition(
      context: context,
      state: state,
      child: BlocProvider(create: (_) => HomeBloc(), child: const HomeScreen()),
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

  // static GoRoute _signUpPageRouteBuilder() {
  //   return GoRoute(
  //     path: RoutesConstants.signUpRoute,
  //     builder: (BuildContext context, GoRouterState state) {
  //       return BlocProvider(create: (BuildContext context) => RegisterCubit(), child: const RegisterScreen());
  //     },
  //   );
  // }

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      _splashPageRouteBuilder(),
      _loginPageRouteBuilder(),
      // _signUpPageRouteBuilder(),
      _homePageRouteBuilder(),
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
