import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/features/authentication/screens/widgets/products.cart/product_card_vertical.dart';
import 'package:t_store/utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Nike')), // Added const here
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Brand Detail
              GridView.builder(
                itemCount: 4,
                shrinkWrap: true,
                physics:
                    const AlwaysScrollableScrollPhysics(), // Prevents scrolling conflicts with SingleChildScrollView
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: TSizes.gridViewspacing,
                  crossAxisSpacing: TSizes.gridViewspacing,
                  mainAxisExtent: 288,
                ),
                itemBuilder: (_, index) => const TProductCardVertical(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
