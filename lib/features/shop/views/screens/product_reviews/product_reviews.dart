import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/features/shop/screens/home/widgets/product_reviews/rating_progress_indicator.dart';
import 'package:t_store/features/shop/screens/home/widgets/product_reviews/user_review_card.dart';
import 'package:t_store/features/shop/screens/home/widgets/ratings/rating_indicator.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -- App Bar
      appBar: const TAppBar(
        title: Text('Reviews & Ratings'),
      ),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'Ratings and reviews are verified and are from people who use the same type of device that you use '),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// -- Overall Product Ratings
              const TOverallProductRating(),
              const TRatingBarIndicator(rating: 3.5),
              Text("12,611", style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Image
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),

      ///
    );
  }
}
