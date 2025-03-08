import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// -- Drop Down
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            prefixIcon: Icon(Iconsax.sort),
          ),
          onChanged: (value) {},
          items: [
            'Name',
            'Higher Price',
            'Lower Price',
            'Sale',
            'Newest',
            'Popularity'
          ]
              .map((option) => DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  ))
              .toList(),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),

        /// -- Products
        // GridView.builder(
        //   itemCount: 4,
        //   shrinkWrap: true,
        //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 2,
        //     mainAxisSpacing: TSizes.gridViewspacing,
        //     crossAxisSpacing: TSizes.gridViewspacing,
        //     mainAxisExtent: 288,
        //   ),
        //   itemBuilder: (_, index) => const TProductCardVertical(),
        // ),
      ],
    );
  }
}
