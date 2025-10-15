import 'package:business_code_by_mohamed_salah/core/services/localization_service.dart';
import 'package:flutter/material.dart';

import '../constants/color_constants.dart';
import '../services/service_locator.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      fontFamily: sl<LocalizationService>().isArabic(context) ? 'dinNextIt' : 'Poppins',
      primarySwatch: Colors.blue,
      primaryColor: ColorConstants.primaryColor,
      scaffoldBackgroundColor: ColorConstants.backgroundColor,

    );
  }
}
