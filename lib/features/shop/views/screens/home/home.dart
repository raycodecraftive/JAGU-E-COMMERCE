import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/authentication/screens/address/widgets/custom_shapes/containers/TCartCounterIcon.dart';
import 'package:t_store/features/authentication/screens/widgets/products.cart/product_card_vertical.dart';
import 'package:t_store/features/shop/viewmodels/product.viewmodel.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/device/device_utility.dart';
import 'package:t_store/utils/extensions/user.extension.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductViewModel>().loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await context.read<ProductViewModel>().loadProducts();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              /// -- Header
              TPrimaryHeaderContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// -- App Bar
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
                    const SizedBox(height: TSizes.spaceBtwItems),

                    /// Search Bar
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.defaultSpace),
                      child: GestureDetector(
                        onTap: () {
                          // Navigate to search screen
                          // Get.to(() => const SearchScreen());
                        },
                        child: Container(
                          width: TDeviceUtils.getScreenWidth(context),
                          padding: const EdgeInsets.all(TSizes.md),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(TSizes.cardRadiusLg),
                            border: Border.all(color: TColors.grey),
                          ),
                          child: Row(
                            children: [
                              const Icon(Iconsax.search_normal,
                                  color: TColors.grey),
                              const SizedBox(width: TSizes.spaceBtwItems),
                              Text('Search in Store',
                                  style: Theme.of(context).textTheme.bodySmall),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),

                    /// Categories Heading
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
                      child: TSectionHeading(title: 'Popular Categories'),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    /// -- Categories List
                    Consumer<ProductViewModel>(
                      builder: (context, state, _) {
                        return SizedBox(
                          height: 100,
                          child: ListView.builder(
                            padding: const EdgeInsets.only(
                                left: TSizes.defaultSpace),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: state.categories.length,
                            itemBuilder: (_, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    right: TSizes.spaceBtwItems),
                                child: Column(
                                  children: [
                                    /// -- Circular Icon
                                    Container(
                                      width: 56,
                                      height: 56,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          // Navigate to subcategory
                                          // Get.to(() => const SubCategoriesScreen());
                                        },
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: const Center(
                                          child: Image(
                                            image: AssetImage(TImages.shoeIcon),
                                            fit: BoxFit.cover,
                                            color: TColors.dark,
                                            width: 32,
                                            height: 32,
                                          ),
                                        ),
                                      ),
                                    ),

                                    /// -- Category Text
                                    const SizedBox(
                                        height: TSizes.spaceBtwItems / 2),
                                    SizedBox(
                                      child: Text(
                                        state.categories[index].name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium!
                                            .apply(color: TColors.black),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              /// -- Body
              Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// -- Section Heading
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Popular Products',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        TextButton(
                          onPressed: () {
                            // Navigate to all products
                            // Get.to(() => const AllProducts());
                          },
                          child: const Text('View All'),
                        ),
                      ],
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    /// -- Products Grid
                    Consumer<ProductViewModel>(
                      builder: (context, productVM, _) {
                        if (productVM.isProductLoading) {
                          return const Center(
                            child: Padding(
                              padding: EdgeInsets.all(TSizes.defaultSpace),
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }

                        if (productVM.isError) {
                          return Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.all(TSizes.defaultSpace),
                              child: Column(
                                children: [
                                  const Text(
                                      'An error occurred loading products'),
                                  const SizedBox(height: TSizes.spaceBtwItems),
                                  ElevatedButton(
                                    onPressed: () => productVM.loadProducts(),
                                    child: const Text('Retry'),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }

                        if (productVM.products.isEmpty) {
                          return const Center(
                            child: Padding(
                              padding: EdgeInsets.all(TSizes.defaultSpace),
                              child: Text('No products available'),
                            ),
                          );
                        }

                        return GridView.builder(
                          itemCount: productVM.products.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: TSizes.gridViewspacing,
                            crossAxisSpacing: TSizes.gridViewspacing,
                            mainAxisExtent:
                                338, // Reduced height for better appearance
                          ),
                          itemBuilder: (_, index) {
                            return TProductCardVertical(
                              product: productVM.products[index],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
