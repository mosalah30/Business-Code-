import 'package:business_code_by_mohamed_salah/core/constants/app_constants.dart';
import 'package:business_code_by_mohamed_salah/router/router.dart';
import 'package:business_code_by_mohamed_salah/core/services/service_locator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/services/localization_service.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await setupLocator();

  runApp(
    EasyLocalization(
      saveLocale: true,
      supportedLocales: sl<LocalizationService>().supportedLocales,
      path: sl<LocalizationService>().path,
      fallbackLocale: sl<LocalizationService>().fallbackLocale,
      child: Builder(
        builder: (context) {
          return const MyApp();
        }
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return MaterialApp.router(
      //    key: ValueKey(context.locale.languageCode), // 👈 forces rebuild
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          debugShowCheckedModeBanner: false,
          locale: context.locale,
          routerConfig: AppRouter.router,
          title: AppConstants.appName,
          theme: AppTheme.lightTheme(context),
          builder: (context, child) {
            final mediaQueryData = MediaQuery.of(context);
            return MediaQuery(
              data: mediaQueryData.copyWith(textScaler: const TextScaler.linear(1)),
              child: child!,
            );
          },
        );
      },
    );
  }
}
