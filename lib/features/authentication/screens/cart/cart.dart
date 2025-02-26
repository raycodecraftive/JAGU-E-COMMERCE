import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/features/authentication/screens/cart/add_item.dart'; // Ensure correct import path
import 'package:t_store/features/authentication/screens/cart/add_remove_button.dart';
import 'package:t_store/features/authentication/screens/cart/cart_item.dart';
import 'package:t_store/utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: List.generate(4, (index) {
              return Column(
                children: [
                  const TCartItem(),
                  const SizedBox(
                      height: TSizes.spaceBtwItems), // Vertical spacing
                  Row(
                    children: [
                      const SizedBox(width: 70), // Extra space for alignment

                      /// -- Add Remove Buttons
                      const TProductQuantityWithAddRemove(),
                      const SizedBox(width: TSizes.spaceBtwItems),
                      const TAddButton(),
                      const SizedBox(width: TSizes.spaceBtwItems),
                      Text('£256',
                          style: Theme.of(context).textTheme.titleSmall),
                    ],
                  ),
                  // Vertical spacing
                ],
              );
            }),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () {
            // Get.to(() => const CheckoutScreen());
          },
          child: const Text('Checkout \$256.0'),
        ),
      ),
    );
  }
}
