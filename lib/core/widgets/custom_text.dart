import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? decorationColor;
  final double? fontSize;
  final int? maxLines;
  final TextOverflow? overflow;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;

  const CustomTextWidget({required this.text,
    this.color,
    this.overflow,
    this.fontSize,
    this.maxLines,
    this.decorationColor,
    this.fontFamily,
    this.fontWeight,
    this.textAlign,
    this.textDecoration,
    super.key});

  @override
  Widget build(BuildContext context) {
      return Text(
        text,
        maxLines: maxLines,
        textAlign: textAlign,
        overflow: overflow ?? TextOverflow.ellipsis,
        style: TextStyle(
          decorationColor: decorationColor,
          decoration: textDecoration,
          color: color ?? Colors.black,
          fontSize: fontSize ?? 12.sp,
          fontWeight: fontWeight ?? FontWeight.w500,
        ),
      );

  }
}
