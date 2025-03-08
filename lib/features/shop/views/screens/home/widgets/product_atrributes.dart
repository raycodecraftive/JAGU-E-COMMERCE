import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/chips/rounded_choice_chips.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/common/widgets/texts/t_product_price_text.dart';
import 'package:t_store/common/widgets/texts/t_product_title_text.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          /// -- Selected Attributes Pricing & Description
          TRoundedContainer(
            padding: const EdgeInsets.all(TSizes.md),
            backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// -- Title, Price, and Stock Status
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TSectionHeading(
                      title: 'Variation',
                      showActionButton: false,
                    ),
                    const SizedBox(width: TSizes.spaceBtwItems),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// -- Price Row
                          Row(
                            children: [
                              const TProductTitleText(
                                title: 'Price:',
                                smallSize: true,
                              ),
                              const SizedBox(width: TSizes.spaceBtwItems),
                              Text(
                                '\$25',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      decoration: TextDecoration.lineThrough,
                                    ),
                              ),
                              const SizedBox(width: TSizes.spaceBtwItems),
                              const TProductPriceText(price: '20'),
                            ],
                          ),
                          const SizedBox(height: TSizes.spaceBtwItems / 2),

                          /// -- Stock Row
                          Row(
                            children: [
                              const TProductTitleText(
                                title: 'Stock:',
                                smallSize: true,
                              ),
                              const SizedBox(width: TSizes.spaceBtwItems),
                              Text(
                                'In Stock',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwItems),

                /// -- Variation Description
                const TProductTitleText(
                  title: 'This is the Description and could go up to 4 lines',
                  smallSize: true,
                  maxLines: 4,
                ),
              ],
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwItems),

          /// -- Colors Attribute
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TSectionHeading(title: 'Colors'),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              Wrap(
                spacing: TSizes.spaceBtwItems,
                children: [
                  TChoiceChip(
                    text: 'Green',
                    selected: true,
                    onSelected: (value) {},
                  ),
                  TChoiceChip(
                    text: 'Blue',
                    selected: false,
                    onSelected: (value) {},
                  ),
                  TChoiceChip(
                    text: 'Yellow',
                    selected: false,
                    onSelected: (value) {},
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwItems),

          /// -- Size Attribute
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TSectionHeading(title: 'Size'),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              Wrap(
                spacing: TSizes.spaceBtwItems,
                children: [
                  TChoiceChip(
                    text: 'EU 34',
                    selected: true,
                    onSelected: (value) {},
                  ),
                  TChoiceChip(
                    text: 'EU 36',
                    selected: false,
                    onSelected: (value) {},
                  ),
                  TChoiceChip(
                    text: 'EU 38',
                    selected: false,
                    onSelected: (value) {},
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
