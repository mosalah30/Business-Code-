import 'package:business_code_by_mohamed_salah/core/constants/color_constants.dart';
import 'package:flutter/material.dart' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../constants/asset_constants.dart';
import '../services/service_locator.dart';
import 'custom_text.dart';

import '../services/localization_service.dart';

class PasswordField extends StatefulWidget {
  final String label;
  final String placeholder;
  final TextEditingController textEditingController;

  const PasswordField({super.key, required this.label, required this.placeholder, required this.textEditingController});

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool passwordVisible = false;
  bool _hasFocus = false;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        setState(() {
          _hasFocus = hasFocus;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: _hasFocus ? ColorConstants.primaryColor : const Color(0xffBDBEC0)),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: TextField(
          onTapOutside: (c) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          controller: widget.textEditingController,
          obscureText: !passwordVisible,
          decoration: InputDecoration(
            prefixIcon: (!_hasFocus && widget.textEditingController.text.trim().isEmpty)
                ? Padding(
                    padding: EdgeInsets.all(12.r),
                    child: SvgPicture.asset(AssetsConstant.passwordLoginIcon, fit: BoxFit.contain, width: 16.w),
                  )
                : null,
            label: CustomTextWidget(
              fontSize: 16.sp,
              text: widget.label,
              color: _hasFocus ? ColorConstants.primaryColor : Colors.black,
            ),
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            border: InputBorder.none,
            hintText: widget.placeholder,
            hintStyle: TextStyle(color: Colors.grey),
            suffixIcon: ui.InkWell(
              child: passwordVisible
                  ? Padding(padding: const EdgeInsets.all(10.0), child: SvgPicture.asset(AssetsConstant.eyeOpenedIcon))
                  : Padding(padding: const EdgeInsets.all(10.0), child: SvgPicture.asset(AssetsConstant.eyeClosedIcon)),
              onTap: () => setState(() => passwordVisible = !passwordVisible),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomFormField extends StatefulWidget {
  final String label;
  final Widget? icon;
  final Widget? suffixIcon;
  final bool isEnable;
  final bool showHintByDefault;
  final String? placeholder;
  final TextInputType? keyboardType;
  final TextEditingController textEditingController;
  final int? maxLines;
  final int? maxLength;
  final bool isRequiredStar;
  final String? errorMessage;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final GlobalKey<FormState>? globalKey;
  final AutovalidateMode? autoValidateMode;
  final Function(String)? onChanged;

  const CustomFormField({
    super.key,
    required this.label,
    this.icon,
    this.suffixIcon,
    this.globalKey,
    this.onChanged,
    this.validator,
    this.autoValidateMode,
    this.errorMessage,
    this.isRequiredStar = false,
    this.maxLines = 1,
    this.maxLength,
    this.placeholder,
    this.isEnable = true,
    required this.textEditingController,
    this.inputFormatters,
    this.keyboardType,
    this.showHintByDefault = false,
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> with AutomaticKeepAliveClientMixin {
  bool _hasFocus = false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Focus(
      onFocusChange: (hasFocus) {
        setState(() {
          _hasFocus = hasFocus;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: _hasFocus ? ColorConstants.primaryColor : const Color(0xffBDBEC0)),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: TextFormField(
          onChanged: widget.onChanged,
          key: widget.globalKey,
          autovalidateMode: widget.autoValidateMode ?? AutovalidateMode.onUserInteraction,
          validator: widget.validator,
          maxLength: widget.maxLength,
          maxLines: widget.maxLines,
          onTapOutside: (c) => FocusManager.instance.primaryFocus?.unfocus(),
          enabled: widget.isEnable,
          controller: widget.textEditingController,
          inputFormatters: widget.inputFormatters,
          keyboardType: widget.keyboardType,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            floatingLabelBehavior: widget.showHintByDefault ? FloatingLabelBehavior.always : FloatingLabelBehavior.auto,
            label: CustomTextWidget(
              fontSize: 16.sp,
              text: widget.label,
              color: _hasFocus ? ColorConstants.primaryColor : Colors.black,
            ),
            fillColor: Colors.white,
            prefixIcon: (widget.icon != null && !_hasFocus)
                ? Padding(padding: EdgeInsets.all(12.r), child: widget.icon!)
                : null,
            suffixIcon: (widget.suffixIcon != null)
                ? Padding(padding: EdgeInsets.all(12.r), child: widget.suffixIcon!)
                : null,
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            border: InputBorder.none,
            hintText: widget.placeholder,
            hintStyle: TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _hasFocus = widget.showHintByDefault;
  }
}

class MainButton extends StatelessWidget {
  final String label;
  final bool? disabled;
  final double? width;
  final Color? color;
  final TextStyle? textStyle;

  final Function()? onPressed;

  const MainButton({
    Key? key,
    required this.label,
    this.disabled,
    this.textStyle,
    this.color,
    required this.onPressed,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: (disabled == null || disabled == false)
            ? color ?? ColorConstants.primaryColor
            : color?.withOpacity(.5) ?? Colors.black12,
      ),
      child: InkWell(
        onTap: (disabled == null || disabled == false) ? onPressed : null,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: Center(
            child: Text(
              label,
              style:
                  textStyle ??
                  TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
