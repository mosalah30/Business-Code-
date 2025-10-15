import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SnackBarUtil {
  static void showWarningSnackBar({required BuildContext context, String? title, String message = ''}) {
    var snackBar = SnackBar(
      elevation: 0,
      backgroundColor: Colors.white,
      behavior: SnackBarBehavior.fixed,
      duration: const Duration(seconds: 3),
      // margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      content: Container(
        width: double.infinity,
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border(
            left: const BorderSide(color: Colors.yellow, width: .1),
            top: const BorderSide(color: Colors.yellow, width: .1),
            right: const BorderSide(color: Colors.yellow, width: .1),
            bottom: BorderSide(width: 5.w, color: Colors.yellow),
          ),
          boxShadow: const [
            BoxShadow(color: Color(0x331C3B54), blurRadius: 18, offset: Offset(0, 0), spreadRadius: -1),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title ?? 'warning'.tr(),
              style: TextStyle(color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w600, letterSpacing: -0.05),
            ),
            SizedBox(height: 16.h),
            Text(
              message,
              style: TextStyle(color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w400, letterSpacing: -0.04),
            ),
          ],
        ),
      ),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  static void showSuccessSnackBar({required BuildContext context, String? title, String message = ''}) {
    var snackBar = SnackBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.fixed,
      duration: const Duration(seconds: 3),
      // margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      content: Container(
        width: double.infinity,
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border(
            left: const BorderSide(color: Color(0xFF81F1B2), width: .1),
            top: const BorderSide(color: Color(0xFF81F1B2), width: .1),
            right: const BorderSide(color: Color(0xFF81F1B2), width: .1),
            bottom: BorderSide(width: 5.w, color: const Color(0xFF81F1B2)),
          ),
          boxShadow: const [
            BoxShadow(color: Color(0x331C3B54), blurRadius: 18, offset: Offset(0, 0), spreadRadius: -1),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title ?? 'success'.tr(),
              style: TextStyle(color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w600, letterSpacing: -0.05),
            ),
            SizedBox(height: 16.h),
            Text(
              message,
              style: TextStyle(color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w400, letterSpacing: -0.04),
            ),
          ],
        ),
      ),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  static void showErrorSnackBar({required BuildContext context, String? title, String message = ''}) {
    var snackBar = SnackBar(
      elevation: 0,
      backgroundColor: Colors.white,
      behavior: SnackBarBehavior.fixed,
      duration: const Duration(seconds: 3),
      // margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      content: Container(
        width: double.infinity,
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border(
            left: const BorderSide(color: Colors.red, width: .1),
            top: const BorderSide(color: Colors.red, width: .1),
            right: const BorderSide(color: Colors.red, width: .1),
            bottom: BorderSide(width: 5.w, color: Colors.red),
          ),
          boxShadow: const [
            BoxShadow(color: Color(0x331C3B54), blurRadius: 18, offset: Offset(0, 0), spreadRadius: -1),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title ?? 'Error'.tr(),
              style: TextStyle(color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w600, letterSpacing: -0.05),
            ),
            SizedBox(height: 16.h),
            Text(
              message,
              style: TextStyle(color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w400, letterSpacing: -0.04),
            ),
          ],
        ),
      ),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }
}
