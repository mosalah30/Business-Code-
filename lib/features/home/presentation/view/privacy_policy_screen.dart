import 'package:business_code_by_mohamed_salah/core/constants/color_constants.dart';
import 'package:business_code_by_mohamed_salah/core/widgets/custom_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.primaryColor,
        title: CustomTextWidget(text: 'privacy_policy'.tr(), color: Colors.white),
        centerTitle: true,
      ),
      body: Padding(
        padding:  EdgeInsets.all(16.r),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Last updated: October 1, 2025', style: TextStyle(fontWeight: FontWeight.bold)),
               SizedBox(height: 16.h),
              const Text(
                'Welcome to Business Code App! Your privacy is important to us. '
                'This Privacy Policy explains how we collect, use, and protect your information.',
                style: TextStyle(height: 1.5),
              ),
               SizedBox(height: 24.h),
              const Text('1. Information We Collect', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
               SizedBox(height: 8.h),
              const Text(
                'We may collect personal information such as your name, email, and usage data when you use our app.',
                style: TextStyle(height: 1.5),
              ),
               SizedBox(height: 24.h),
              const Text('2. How We Use Your Information', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
               SizedBox(height: 8.h),
              const Text(
                'Your information is used to improve the app experience, communicate updates, and ensure security.',
                style: TextStyle(height: 1.5),
              ),
               SizedBox(height: 24.h),
              const Text('3. Data Security', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
               SizedBox(height: 8.h),
              const Text(
                'We use appropriate security measures to protect your personal data, '
                'but no system is completely secure.',
                style: TextStyle(height: 1.5),
              ),
               SizedBox(height: 24.h),
              const Text('4. Changes to This Policy', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 8),
              const Text(
                'We may update this Privacy Policy periodically. Please review it regularly for changes.',
                style: TextStyle(height: 1.5),
              ),
               SizedBox(height: 24.h),
              const Text('5. Contact Us', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
               SizedBox(height: 8.h),
              const Text(
                'If you have any questions, contact us at support@businesscodeapp.com.',
                style: TextStyle(height: 1.5),
              ),
               SizedBox(height: 32.h),
              Center(
                child: Text(
                  '© 2025 Business Code App. All rights reserved.',
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
