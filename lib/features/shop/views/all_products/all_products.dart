import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/features/authentication/screens/widgets/products.cart/sortable/sortable_products.dart';
import 'package:t_store/utils/constants/sizes.dart'; // Ensure that TSizes is imported

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      /// -- App Bar
      appBar: TAppBar(
          title: Text('Popular Products'),
          showBackArrow: true), // Corrected parenthesis
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes
              .defaultSpace), // Fixed 'EdgeInsets' and 'TSizes.defaultSpace'
          child: TSortableProducts(),
        ),
      ),
    );
  }
}
