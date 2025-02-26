import 'package:flutter/material.dart';
import 'package:t_store/checkout/billing_address_section.dart';
import 'package:t_store/checkout/billing_amount_section.dart';
import 'package:t_store/checkout/billing_payment_section.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/features/authentication/screens/cart/cart_item.dart';
import 'package:t_store/features/authentication/screens/cart/coupon_widget.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Order Review',
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Items in Cart
              const TCartItem(),
              const TCartItem(),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// -- Coupon TextField
              const TCouponCode(),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// -- Billing Sections
              TRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: const Column(
                  children: [
                    /// -- Pricing
                    TBillingAmountSection(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    /// -- Divider
                    Divider(),
                    SizedBox(height: TSizes.spaceBtwSections),

                    /// Payment Methods
                    TBillingPaymentSection(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    /// Address
                    TBillingAddressSection(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

      /// -- Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () {
            // Get.to(() => SuccessScreen(
            //       image: TImages.successfulPaymentIcon,
            //       title: 'Payment Success !',
            //       subTitle: 'Your item will be shipped soon !',
            //       onPressed: () => Get.offAll(() => const NavigationMenu()),
            //     ));
          },
          child: const Text('Checkout \$256.0'),
        ),
      ),
    );
  }
}
