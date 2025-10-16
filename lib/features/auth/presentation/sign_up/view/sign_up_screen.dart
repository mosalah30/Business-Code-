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
import '../bloc/sign_up_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String getErrorMessage() {
    String errorText = '';
    if (_nameController.text.isEmpty) {
      errorText = "please_enter_name".tr();
    } else if (isValidEmail(_emailController.text) == false || _emailController.text.isEmpty) {
      errorText = "enter_valid_email".tr();
    } else if (_passwordController.text.isEmpty) {
      errorText = "please_enter_password".tr();
    } else if (_passwordController.text.length < 8) {
      errorText = "password_length".tr();
    } else if (_passwordController.text != _confirmPasswordController.text) {
      errorText = "password_equal".tr();
    }
    return errorText;
  }

  bool isValidPassword(String password) {
    final regex = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
    return regex.hasMatch(password);
  }

  bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _signup() {
    if (_formKey.currentState!.validate()) {
      context.read<SignUpBloc>().add(
        SignUpButtonPressed(
          email: _emailController.text,
          password: _passwordController.text,
          name: _nameController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<SignUpBloc, SignUpState>(
          listener: (context, state) {
            if (state is SignUpSuccess) {
              context.go(RoutesConstants.homeRoute);
            } else if (state is SignUpFailure) {
              SnackBarUtil.showErrorSnackBar(context: context, message: state.message.tr());
            }
          },
          builder: (context, state) => Stack(
            alignment: Alignment.center,
            children: [
              IgnorePointer(
                ignoring: state is SignUpLoading,
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
                                context.pop();
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
                          text: 'register_title'.tr(),
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8.h),
                        CustomTextWidget(
                          text: 'register_subtitle'.tr(),
                          fontSize: 16.sp,
                          color: Colors.grey,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.visible,
                        ),
                        SizedBox(height: 48.h),
                        CustomFormField(
                          icon: Icon(Icons.person, color: Colors.grey, size: 20.sp),
                          label: "full_name".tr(),
                          placeholder: "type_full_name".tr(),
                          textEditingController: _nameController,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 16.h),
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
                        SizedBox(height: 16.h),
                        PasswordField(
                          label: "confirm_password".tr(),
                          placeholder: "type_confirm_password".tr(),
                          textEditingController: _confirmPasswordController,
                        ),
                        SizedBox(height: 32.h),
                        BlocBuilder<SignUpBloc, SignUpState>(
                          builder: (context, state) {
                            return MainButton(
                              onPressed: () {
                                String error = getErrorMessage();
                                if (error.isNotEmpty) {
                                  SnackBarUtil.showErrorSnackBar(context: context, message: error);
                                  return;
                                }
                                _signup();
                              },
                              label: 'sign'.tr(),
                            );
                          },
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomTextWidget(text: "haveـaccount".tr()),
                            TextButton(
                              onPressed: () {
                                context.pushReplacement(RoutesConstants.signInRoute);
                              },
                              child: CustomTextWidget(text: 'login'.tr(), color: ColorConstants.primaryColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (state is SignUpLoading) ...[
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
