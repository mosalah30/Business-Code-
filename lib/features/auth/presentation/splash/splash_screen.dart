import 'dart:async';

import 'package:business_code_by_mohamed_salah/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/asset_constants.dart';
import '../../../../router/routes_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer animationTimer;
  int index = 0;
  double _scale = 0.0;

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  void startAnimation() {
    animationTimer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      _scale = 1;
      if (index < 2) {
        index += 1;
      } else if (index == 2) {
        index = 0;
      }
      setState(() {});
    });
    Future.delayed(const Duration(seconds: 3)).then((value) => context.go(RoutesConstants.homeRoute));
  }

  @override
  void dispose() {
    animationTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          Opacity(
            opacity: .7,
            child: Container(
              height: 1.sh,
              width: 1.sw,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.00, -1.00),
                  end: Alignment(0, 1),
                  colors: [ColorConstants.primaryColor, Colors.white],
                ),
              ),
            ),
          ),

          Center(
            child: AnimatedScale(
              scale: _scale,
              duration: const Duration(seconds: 1),
              curve: Curves.easeOutBack, // smooth "pop" effect
              child: Hero(
                tag: AppConstants.animateTransition,
                child: SvgPicture.asset(AssetsConstant.logoIcon, fit: BoxFit.contain, width: .6.sw),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(32.r),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedSmoothIndicator(
                activeIndex: index,
                count: 3,
                effect: SwapEffect(
                  activeDotColor: ColorConstants.primaryColor.withOpacity(.6),
                  dotColor: ColorConstants.primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
