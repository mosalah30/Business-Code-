import 'package:business_code_by_mohamed_salah/core/constants/app_constants.dart';
import 'package:business_code_by_mohamed_salah/core/constants/asset_constants.dart';
import 'package:business_code_by_mohamed_salah/core/constants/color_constants.dart';
import 'package:business_code_by_mohamed_salah/core/utils/print.dart';
import 'package:business_code_by_mohamed_salah/core/widgets/custom_text.dart';
import 'package:business_code_by_mohamed_salah/features/home/presentation/bloc/home_bloc.dart';
import 'package:business_code_by_mohamed_salah/features/home/presentation/bloc/home_state.dart';
import 'package:business_code_by_mohamed_salah/features/home/presentation/view/widgets/drawer_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/services/localization_service.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/snackbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeLanguageChanged) {
          iPrint(context.locale.languageCode);
          SnackBarUtil.showSuccessSnackBar(context: context, message: "language_success".tr());
        }
      },
      builder: (context, state) {
        return Scaffold(
          drawer: DrawerWidget(),
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: ColorConstants.primaryColor,
            title: Hero(tag: AppConstants.animateTransition, child: SvgPicture.asset(AssetsConstant.whiteLogoIcon)),
          ),
          body: Center(
            child: Column(
              children: [
                Lottie.asset(LottieConstants.emptyLottie),
                SizedBox(height: 24.h),
                CustomTextWidget(
                  text: 'welcome'.tr(),
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.h),
                CustomTextWidget(
                  text: 'welcome_body'.tr(),
                  fontSize: 16.sp,
                  color: Colors.grey,
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              SnackBarUtil.showSuccessSnackBar(context: context, message: "language_success".tr());
            },
            backgroundColor: ColorConstants.primaryColor,
            child: SvgPicture.asset(AssetsConstant.scannerIcon, color: Colors.white, width: 35.w),
          ),
        );
      },
    );
  }
}
