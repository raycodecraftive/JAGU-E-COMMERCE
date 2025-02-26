import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart'; // Adjust according to your project structure
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart'; // Adjust according to your project structure

class TTermsConditionsCheckbox extends StatelessWidget {
  const TTermsConditionsCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Row(
      children: [
        // SizedBox(
        //   width: 24,
        //   height: 24,
        //   child: Obx(
        //     () => Checkbox(
        //         value: controller.privacyPolicy.value,
        //         onChanged: (value) => controller.privacyPolicy.value =
        //             !controller.privacyPolicy.value),
        //   ),
        // ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: TTexts.and,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: TTexts.privacyPolicy,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark
                          ? TColors.white
                          : const Color.fromARGB(255, 75, 222, 255),
                      decoration: TextDecoration.underline,
                      decorationColor: dark
                          ? TColors.white
                          : const Color.fromARGB(255, 75, 183, 255),
                    ),
              ),
              TextSpan(
                text: TTexts.and,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: TTexts.termsOfUse,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark
                          ? TColors.white
                          : const Color.fromARGB(255, 75, 189, 255),
                      decoration: TextDecoration.underline,
                      decorationColor: dark
                          ? TColors.white
                          : const Color.fromARGB(255, 75, 195, 255),
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
