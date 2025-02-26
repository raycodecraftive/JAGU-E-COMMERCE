import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/device/device_utility.dart';

class OnboardingDotNavigation extends StatelessWidget {
  const OnboardingDotNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: TSizes.defaultSpace,
      child: SizedBox(),
      // child: SmoothPageIndicator(
      //   count: 3,
      //   controller: controller.pageController,
      //   onDotClicked: controller.dotNavigationClick,
      //   effect: ExpandingDotsEffect(
      //       activeDotColor: dark ? TColors.light : TColors.dark, dotHeight: 6),
      // ),
    );
  }
}
