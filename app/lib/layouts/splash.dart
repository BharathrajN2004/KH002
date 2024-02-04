import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';

import '../utilities/theme/color_data.dart';
import '../utilities/theme/size_data.dart';
import '../components/common/text.dart';

import '../auth_shifter.dart';
class Splash extends ConsumerWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CustomSizeData sizeData = CustomSizeData.from(context);
    CustomColorData colorData = CustomColorData.from(ref);

    return Scaffold(
      body: SafeArea(
        child: AnimatedSplashScreen(
          backgroundColor: const Color(0xFFF7F8FC),
          animationDuration: const Duration(milliseconds: 600),
          duration: 2000,
          curve: Curves.easeInBack,
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.fade,
          nextScreen: const AuthShifter(),
          splashIconSize: sizeData.height,
          splash: Container(
            padding: EdgeInsets.symmetric(horizontal: sizeData.width * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: sizeData.height * 0.03,
                    bottom: sizeData.height * 0.04,
                    left: sizeData.width * 0.02,
                    right: sizeData.width * 0.02,
                  ),
                  child: Image.asset(
                    "assets/images/splash2.png",
                    width: sizeData.width,
                    fit: BoxFit.fill,
                  ),
                ),
                CustomText(
                  text: "Easy way to split payment",
                  color: colorData.fontColor(1),
                  size: sizeData.aspectRatio * 65,
                  weight: FontWeight.bold,
                  maxLine: 2,
                ),
                SizedBox(
                  height: sizeData.height * 0.02,
                ),
                CustomText(
                  text: "split payment with your beloved, friends, or anyone!",
                  color: colorData.fontColor(.6),
                  size: sizeData.medium,
                  weight: FontWeight.bold,
                  maxLine: 2,
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: sizeData.width * 0.7,
                    padding: EdgeInsets.symmetric(
                      horizontal: sizeData.width * 0.04,
                      vertical: sizeData.height * 0.015,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: colorData.primaryColor(1),
                    ),
                    child: CustomText(
                      text: "GET STARTED",
                      color: Colors.white,
                      size: sizeData.medium,
                      weight: FontWeight.bold,
                      align: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: sizeData.height * 0.06,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
