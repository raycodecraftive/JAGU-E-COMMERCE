import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Nike')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Brand Detail
              // GridView.builder(
              //   itemCount: 4,
              //   shrinkWrap: true,
              //   physics:
              //       const NeverScrollableScrollPhysics(), // Prevents scrolling conflicts with SingleChildScrollView
              //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 2,
              //     mainAxisSpacing: TSizes.gridViewSpacing,
              //     crossAxisSpacing: TSizes.gridViewSpacing,
              //     mainAxisExtent: 288,
              //   ),
              //   itemBuilder: (_, index) => const TProductCardVertical(),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
