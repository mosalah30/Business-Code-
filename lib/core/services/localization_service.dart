import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import '../utils/print.dart';
import '../utils/snackbar.dart';

const englishLocalKey = "en";
const arabicLocalKey = "ar";

class LocalizationService {
  String path = 'assets/i18n';
  List<Locale> supportedLocales = [const Locale('en'), const Locale('ar')];

  // final settingsService = Get.find<SettingsService>();

  Map<String, String> en = {"x": "x"};

  Map<String, String> ar = {"x": "x"};
  final fallbackLocale = const Locale('en');

  Future<void> changeLanguage({required BuildContext context}) async {
    if (context.locale.languageCode == 'en') {
      await context.setLocale(const Locale('ar'));
    } else {
      await context.setLocale(const Locale('en'));
    }

  }

  Locale getCurrentLocal(BuildContext context) {
    dPrint("Get locale: ${context.locale.languageCode}");
    return context.locale;
  }

  bool isArabic(BuildContext context) {
    return context.locale.languageCode == 'ar';
  }
}
