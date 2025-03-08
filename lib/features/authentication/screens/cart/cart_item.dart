import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:t_store/common/widgets/texts/t_product_title_text.dart';
import 'package:t_store/features/shop/views/screens/home/widgets/images/t_rounded_image2.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // -- Image
        TRoundedImage2(
          imageUrl: TImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.light,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),

        /// -- Title, price and Size
        Expanded(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TBrandTitleTextWithVerifiedIcon(title: 'Nike'),
            const Flexible(
              child: TProductTitleText(
                title: 'Black Sports Shoes',
                maxLines: 1,
              ),
            ),

            /// -- Attributes
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: 'Color', style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                  text: 'Green', style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                  text: 'Size', style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                  text: 'UK 08', style: Theme.of(context).textTheme.bodySmall),
            ]))
          ],
        ))
      ],
    );
  }
}
