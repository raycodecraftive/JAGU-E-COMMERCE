import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/authentication/screens/widgets/product_detail_image_slider.dart';
import 'package:t_store/features/authentication/screens/widgets/products.cart/bottom_add_to_cart_widget.dart';
import 'package:t_store/features/shop/views/screens/home/widgets/product_atrributes.dart';
import 'package:t_store/features/shop/views/screens/home/widgets/product_meta_data.dart';
import 'package:t_store/features/shop/views/screens/home/widgets/rating_share_widget.dart';
import 'package:t_store/features/shop/views/screens/product_reviews/product_reviews.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine if the theme is dark or light
    THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: const TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Product Image Slider
            const TProductImageSlider(),

            /// -- Product Details
            Padding(
              padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  /// Rating & Share Button
                  const TRatingAndShare(),

                  /// Price, title, stock and brand
                  const TProductMetaData(),

                  /// Attributes
                  const ProductAttributes(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// Checkout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Checkout'),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// Description
                  const TSectionHeading(
                      title: 'Description', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const ReadMoreText(
                    'This is a Product description for Blue Nike Sleeve less vest',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  /// Reviews
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(
                          title: 'Reviews (199)', showActionButton: false),
                      IconButton(
                          icon: const Icon(Iconsax.arrow_right,
                              size: 18, color: Colors.black),
                          // onPressed: () =>
                          //     Get.to(() => const ProductReviewsScreen())),
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ProductReviewsScreen())))
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
