import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Brand'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Heading
              const TSectionHeading(title: 'Brands', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// -- Brands Grid
              TGridLayout(
                itemCount: 8,
                mainAxisExtent: 80,
                itemBuilder: (context, index) => GestureDetector(
                    //showBorder: true, // Assuming this displays brand information
                    // onTap: () => Get.to(() =>
                    //     const BrandProducts()), // Navigate to BrandProducts on tap
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
