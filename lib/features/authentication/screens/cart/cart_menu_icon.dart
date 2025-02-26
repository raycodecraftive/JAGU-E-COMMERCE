import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/helpers/helper_functions.dart';

/// Custom widget for the cart counter icon
class TCartCounterIcon extends StatelessWidget {
  TCartCounterIcon({
    super.key,
    this.iconColor, // Customize icon color
    this.counterBgColor, // Customize counter background color
    this.counterTextColor, // Customize counter text color
    required this.onPressed,
  });

  final VoidCallback onPressed;
  Color? iconColor, counterBgColor, counterTextColor;

  // Access the CartController using GetX

  @override
  Widget build(BuildContext context) {
    // Check if the app is in dark mode
    final dark = THelperFunctions.isDarkMode(context);

    var controller;
    return Stack(
      children: [
        // IconButton for navigating to the CartScreen
        IconButton(
          onPressed: onPressed,
          // onPressed: () => Get.to(() => const ()),
          icon: Icon(Iconsax.shopping_bag, color: iconColor),
        ),
        // Positioned(
        //   right: 0,
        //   child: Container(
        //     width: TSizes.fontSizeLg,
        //     height: TSizes.fontSizeLg,
        //     decoration: BoxDecoration(
        //       color: counterBgColor ?? (dark ? TColors.white : TColors.black),
        //       borderRadius: BorderRadius.circular(100),
        //     ),
        //     child: Center(
        //       child: Obx(
        //         () => Text(
        //           controller.noOfCartItems.value.toString(),
        //           style: Theme.of(context).textTheme.labelLarge!.apply(
        //                 color: counterTextColor ??
        //                     (dark ? TColors.black : TColors.white),
        //                 fontSizeFactor: 0.8,
        //               ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
