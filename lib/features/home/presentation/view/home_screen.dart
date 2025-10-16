import 'package:business_code_by_mohamed_salah/core/constants/app_constants.dart';
import 'package:business_code_by_mohamed_salah/core/constants/asset_constants.dart';
import 'package:business_code_by_mohamed_salah/core/constants/color_constants.dart';
import 'package:business_code_by_mohamed_salah/core/widgets/custom_text.dart';
import 'package:business_code_by_mohamed_salah/features/home/presentation/bloc/home_bloc.dart';
import 'package:business_code_by_mohamed_salah/features/home/presentation/bloc/home_state.dart';
import 'package:business_code_by_mohamed_salah/features/home/presentation/view/widgets/card_widget.dart';
import 'package:business_code_by_mohamed_salah/features/home/presentation/view/widgets/drawer_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/utils/snackbar.dart';
import '../bloc/home_event.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(InitEvent());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeLanguageChanged) {
          context.read<HomeBloc>().add(InitEvent());
          SnackBarUtil.showSuccessSnackBar(context: context, message: "language_success".tr());
        }
        if (state is AddCardState) {
          _scrollToBottom();
        }
        if (state is HomeError) {
          SnackBarUtil.showErrorSnackBar(context: context, message: state.message.tr());
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
          body: Stack(
            alignment: Alignment.center,
            children: [
              context.read<HomeBloc>().businessCardsList.isNotEmpty
                  ? ListView.builder(
                      controller: _scrollController,
                      itemCount: context.watch<HomeBloc>().businessCardsList.length,
                      itemBuilder: (context, index) {
                        final card = context.watch<HomeBloc>().businessCardsList[index];
                        return AnimatedOpacity(
                          opacity: 1,
                          duration: const Duration(milliseconds: 400),
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 16.h),
                            child: BusinessCardWidget(card: card),
                          ),
                        );
                      },
                    )
                  : Center(
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
              if (state is HomeLoading) ...[
                Container(
                  color: Colors.black.withOpacity(0.5),
                  child: Center(child: CircularProgressIndicator(color: ColorConstants.primaryColor)),
                ),
                Lottie.asset(LottieConstants.cardLottie, width: 300.w),
              ],
            ],
          ),
          floatingActionButton: IgnorePointer(
            ignoring: state is HomeLoading,
            child: FloatingActionButton(
              onPressed: () {
                context.read<HomeBloc>().add(AddCardEvent());
              },
              backgroundColor: ColorConstants.primaryColor,
              child: SvgPicture.asset(AssetsConstant.scannerIcon, color: Colors.white, width: 35.w),
            ),
          ),
        );
      },
    );
  }
}
