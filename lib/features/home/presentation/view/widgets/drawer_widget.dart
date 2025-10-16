import 'package:business_code_by_mohamed_salah/router/routes_constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/asset_constants.dart';
import '../../../../../core/constants/color_constants.dart';
import '../../../../../core/services/localization_service.dart';
import '../../../../../core/services/service_locator.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../bloc/home_bloc.dart';
import '../../bloc/home_event.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(height: .1.sh),
          SvgPicture.asset(AssetsConstant.logoIcon),
          SizedBox(height: 32.h),
          context.read<HomeBloc>().isUserLoggedIn()
              ? Container(
                  margin: EdgeInsets.all(8.h),
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                    color: ColorConstants.primaryColor,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.person, color: Colors.white),
                      SizedBox(width: 16.w),
                      CustomTextWidget(
                        fontSize: 10.sp,
                        text: '${'welcome_title'.tr()}, ${context.read<HomeBloc>().getCurrentUserName()}',
                        color: Colors.white,
                      ),
                    ],
                  ),
                )
              : InkWell(
                  onTap: () {
                    context.pop();
                    context.go(RoutesConstants.signInRoute);
                  },
                  child: Container(
                    margin: EdgeInsets.all(8.h),
                    padding: EdgeInsets.all(12.r),
                    decoration: BoxDecoration(
                      color: ColorConstants.primaryColor,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.email, color: Colors.white),
                        SizedBox(width: 16.w),
                        CustomTextWidget(text: 'login'.tr(), color: Colors.white),
                      ],
                    ),
                  ),
                ),

          InkWell(
            onTap: () {
              context.pop();
              context.push(RoutesConstants.privacyPolicyRoute);
            },
            child: Container(
              margin: EdgeInsets.all(8.h),
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(color: ColorConstants.primaryColor, borderRadius: BorderRadius.circular(15.r)),
              child: Row(
                children: [
                  const Icon(Icons.privacy_tip_outlined, color: Colors.white),
                  SizedBox(width: 16.w),
                  CustomTextWidget(text: 'privacy_policy'.tr(), color: Colors.white),
                ],
              ),
            ),
          ),
          if (context.read<HomeBloc>().isUserLoggedIn())
            InkWell(
              onTap: () {
                context.pop();
                context.read<HomeBloc>().add(SignOutEvent());
              },
              child: Container(
                margin: EdgeInsets.all(8.h),
                padding: EdgeInsets.all(12.r),
                decoration: BoxDecoration(
                  color: ColorConstants.primaryColor,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.logout, color: Colors.white),
                    SizedBox(width: 16.w),
                    CustomTextWidget(text: 'sign_out'.tr(), color: Colors.white),
                  ],
                ),
              ),
            ),
          Spacer(),
          InkWell(
            onTap: () async {
              context.pop();
              await sl<LocalizationService>().changeLanguage(context: context);
              context.read<HomeBloc>().add(ChangeLanguageEvent());
            },

            child: Container(
              margin: EdgeInsets.all(8.h),
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(color: ColorConstants.primaryColor, borderRadius: BorderRadius.circular(15.r)),
              child: Row(
                children: [
                  const Icon(Icons.translate, color: Colors.white),
                  SizedBox(width: 16.w),
                  CustomTextWidget(
                    text: sl<LocalizationService>().isArabic(context) ? 'English' : 'العربية',
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 32.h),
        ],
      ),
    );
  }
}
