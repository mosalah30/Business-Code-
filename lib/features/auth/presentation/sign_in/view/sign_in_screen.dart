import 'package:business_code_by_mohamed_salah/core/constants/asset_constants.dart';
import 'package:business_code_by_mohamed_salah/core/widgets/custom_text.dart';
import 'package:business_code_by_mohamed_salah/core/widgets/custom_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/constants/color_constants.dart';
import '../../../../../core/utils/snackbar.dart';
import '../../../../../router/routes_constants.dart';
import '../bloc/sign_in_bloc.dart';
import '../bloc/sign_in_event.dart';
import '../bloc/sign_in_state.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String getLoginValidationError() {
    String errorText = "";
    if (_emailController.text.isEmpty || isValidEmail(_emailController.text) == false) {
      errorText = "enter_valid_email".tr();
    } else if (_passwordController.text.isEmpty) {
      errorText = "please_enter_password".tr();
    } else if (_passwordController.text.length < 8) {
      errorText = "password_length".tr();
    }

    return errorText;
  }

  bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signIn() {
    if (_formKey.currentState!.validate()) {
      context.read<SignInBloc>().add(
        SignEvent(email: _emailController.text.trim(), password: _passwordController.text),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<SignInBloc, SignInState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              context.go(RoutesConstants.homeRoute,extra: UniqueKey());
            } else if (state is LoginError) {
              SnackBarUtil.showErrorSnackBar(context: context, message: state.message.tr());
            }
          },
          builder: (context, state) => Stack(
            alignment: Alignment.center,
            children: [
              IgnorePointer(
                ignoring: state is LoginLoading,
                child: Padding(
                  padding: const EdgeInsets.all(AppConstants.defaultPadding),
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(width: 16.w),
                            InkWell(
                              onTap: () {
                                context.go(RoutesConstants.homeRoute);
                              },
                              child: Container(
                                padding: EdgeInsets.all(8.r),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: ColorConstants.primaryColor,
                                ),
                                child: Icon(Icons.close, size: 30, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Container(
                          padding: EdgeInsets.all(16.r),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: SvgPicture.asset(AssetsConstant.logoIcon, height: 200.h),
                        ),
                        SizedBox(height: 24.h),
                        CustomTextWidget(
                          text: 'welcome_back'.tr(),
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8.h),
                        CustomTextWidget(
                          text: 'welcome_back_body'.tr(),
                          fontSize: 16.sp,
                          color: Colors.grey,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 48.h),
                        CustomFormField(
                          icon: Icon(Icons.email_outlined, color: Colors.grey, size: 20.sp),
                          label: "email".tr(),
                          placeholder: "type_email".tr(),
                          textEditingController: _emailController,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 16.h),
                        PasswordField(
                          label: "password".tr(),
                          placeholder: "enter_password".tr(),
                          textEditingController: _passwordController,
                        ),
                        SizedBox(height: 32.h),
                        BlocBuilder<SignInBloc, SignInState>(
                          builder: (context, state) {
                            return MainButton(
                              onPressed: () {
                                String error = getLoginValidationError();
                                if (error.isNotEmpty) {
                                  SnackBarUtil.showErrorSnackBar(context: context, message: error);
                                  return;
                                }
                                _signIn();
                              },
                              label: 'login'.tr(),
                            );
                          },
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomTextWidget(text: "not_haveـaccount".tr()),
                            TextButton(
                              onPressed: () {
                                context.pushReplacement(RoutesConstants.signUpRoute);
                              },
                              child: CustomTextWidget(text: 'sign'.tr(), color: ColorConstants.primaryColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (state is LoginLoading) ...[
                Container(color: Colors.black.withOpacity(0.2)),
                Lottie.asset(LottieConstants.loadingLottie, width: 300.w),
              ],
            ],
          ),
        ),
      ),
    );
    return SizedBox();
  }
}
