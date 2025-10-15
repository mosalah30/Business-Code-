import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

final logger = Logger();

dPrint(dynamic text) {
  if (kDebugMode) {
    logger.d(text.toString());
  }
}

ePrint(dynamic text) {
  if (kDebugMode) {
    logger.e(text.toString());
  }
}

iPrint(dynamic text) {
  if (kDebugMode) {
    logger.i(text.toString());
  }
}

wPrint(dynamic text) {
  if (kDebugMode) {
    logger.w(text.toString());
  }
}

vPrint(dynamic text) {
  if (kDebugMode) {
    logger.v(text.toString());
  }
}

wtfPrint(dynamic text) {
  if (kDebugMode) {
    logger.wtf(text.toString());
  }
}
