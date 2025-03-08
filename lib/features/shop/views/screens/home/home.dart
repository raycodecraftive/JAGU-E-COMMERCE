import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/authentication/screens/address/widgets/custom_shapes/containers/TCartCounterIcon.dart';
import 'package:t_store/features/authentication/screens/widgets/products.cart/product_card_vertical.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/device/device_utility.dart';
import 'package:t_store/utils/extensions/user.extension.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  TAppBar(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          TTexts.homeAppbarTitle,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .apply(color: TColors.primary),
                        ),
                        Text(
                          "${context.user.firstName} ${context.user.lastName}",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .apply(color: TColors.black),
                        ),
                      ],
                    ),
                    actions: [
                      TCartCounterIcon(
                        onPressed: () {
                          // Navigate to the CartScreen when the icon is pressed
                          // Get.to(() => const CartScreen());
                        },
                        counterBgColor: Colors.black,
                        counterTextColor: Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  /// Search Bar
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.defaultSpace),
                    child: Container(
                      width: TDeviceUtils.getScreenWidth(context),
                      padding: const EdgeInsets.all(TSizes.md),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius:
                              BorderRadius.circular(TSizes.cardRadiusLg),
                          border: Border.all(color: TColors.grey)),
                      child: Row(
                        children: [
                          const Icon(Iconsax.airpod, color: TColors.grey),
                          const SizedBox(width: TSizes.spaceBtwSections),
                          Text('Search in Store',
                              style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: TSectionHeading(title: 'Popular Categories')),

                  /// -- Categories
                  SizedBox(
                    height: 100, // Increased height for better visibility
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      // this will only scroll if you put the alwaysscrollablepysics command
                      itemCount: 6,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              right: TSizes.spaceBtwItems),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment
                                .center, // Center horizontally
                            children: [
                              /// -- Circular Icon
                              InkWell(
                                onTap: () {
                                  // Get.to(() => const SubCategoriesScreen());
                                },
                                child: Container(
                                  width: 56,
                                  height: 50,
                                  padding: const EdgeInsets.all(TSizes.sm),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: const Center(
                                    child: Image(
                                        image: AssetImage(TImages.shoeIcon),
                                        fit: BoxFit.cover,
                                        color: TColors.dark),
                                  ),
                                ),
                              ),

                              /// -- Text
                              //const SizedBox(height: TSizes.spaceBtwItems / 2),
                              SizedBox(
                                width: 80, // Adjust width as needed
                                child: GestureDetector(
                                  onTap: () {
                                    // Get.to(() => const SubCategoriesScreen());
                                  },
                                  child: Text(
                                    'Shoes',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .apply(
                                            color: TColors
                                                .black), // Ensure color contrasts well
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center, // Center text
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            /// -- Body -- Carousal Slider with banners
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Promo Slider
                  // const TPromoSlider(banners: [
                  //   TImages.onBoardingImage1,
                  //   TImages.onBoardingImage2,
                  //   TImages.onBoardingImage3
                  // ]),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// -- Heading
                  // TSectionHeading(
                  //     title: 'Popular Products',
                  //     onPressed: () => Get.to(() => const AllProducts()),),

                  /// -- Popular Products
                  GridView.builder(
                    itemCount: 4,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: TSizes.gridViewspacing,
                      crossAxisSpacing: TSizes.gridViewspacing,
                      mainAxisExtent: 288,
                    ),
                    itemBuilder: (_, index) => const TProductCardVertical(),
                  ),
                  const TProductCardVertical(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
