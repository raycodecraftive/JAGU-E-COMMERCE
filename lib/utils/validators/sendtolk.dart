import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/authentication/screens/widgets/products.cart/product_card_vertical.dart';
import 'package:t_store/features/shop/views/screens/home/widgets/images/promo_slider.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class Sendtolk extends StatelessWidget {
  const Sendtolk({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 100, // Set your desired height
              color: const Color.fromARGB(
                  255, 0, 135, 203), // Use your preferred color
              child: Center(
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'JAGU',
                    style: GoogleFonts.bebasNeue(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Cake Shop'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('Combo Gift Packs'),
              onTap: () {
                // Navigate to Cart
              },
            ),
            ListTile(
              leading: const Icon(Icons.food_bank),
              title: const Text('chocolates'),
              onTap: () {
                // Navigate to Profile
              },
            ),
          ],
        ),
      ),
      // const Color.fromARGB(255, 157, 198, 87),
      //const Color.fromARGB(255, 198, 87, 87),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 198, 87, 87),
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: const Row(
          children: [
            Text(
              "JAGU",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Spacer(),
            Text(
              'Eng',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(width: 10),
            Icon(Iconsax.shopping_cart, color: Colors.white),
            SizedBox(width: 10),
            Icon(Icons.receipt_long, color: Colors.white),
            SizedBox(width: 10),
            Icon(Icons.person, color: Colors.white),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              // Search Bar
              Container(
                height: 45,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    Icon(Iconsax.search_normal, color: Colors.purple),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Explore our Products',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              /// Popular Categories
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: TSectionHeading(title: 'Popular Categories'),
              ),

              /// Categories
              SizedBox(
                height: 100,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(right: TSizes.spaceBtwItems),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          /// Circular Icon
                          InkWell(
                            onTap: () {
                              // Get.to(() => const SubCategoriesScreen());
                            },
                            child: Container(
                              width: 56,
                              height: 50,
                              padding: const EdgeInsets.all(TSizes.sm),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: const Center(
                                child: Image(
                                  image: AssetImage(TImages.shoeIcon),
                                  fit: BoxFit.cover,
                                  color: TColors.dark,
                                ),
                              ),
                            ),
                          ),

                          /// Text
                          SizedBox(
                            width: 80,
                            child: GestureDetector(
                              onTap: () {
                                // Get.to(() => const SubCategoriesScreen());
                              },
                              child: Text(
                                'Kottu',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .apply(color: TColors.black),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              /// Body - Carousel Slider with banners
              const TPromoSlider(banners: [
                TImages.firstone,
                TImages.secondone,
                TImages.thirdone,
              ]),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Heading
              TSectionHeading(
                title: 'Popular Products',
                // onPressed: () => Get.to(() => const AllProducts()),
              ),

              /// Popular Products
              GridView.builder(
                itemCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: TSizes.gridViewspacing,
                  crossAxisSpacing: TSizes.gridViewspacing,
                  mainAxisExtent: 288,
                ),
                itemBuilder: (_, index) => const TProductCardVertical(),
              ),
              const SizedBox(height: 10),

              /// Footer Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TSectionHeading(
                      title: "Places you might Like",
                      // onPressed: () => Get.to(() => const AllProducts()),
                    ),
                    const Text(
                      'sponsored',
                      style: TextStyle(fontSize: 15),
                    ),

                    /// Promo Slider
                    const TPromoSlider(
                      banners: [
                        TImages.firstone,
                        TImages.secondone,
                        TImages.thirdone,
                      ],
                    ),
                    const SizedBox(height: 10),
                    TSectionHeading(
                      title: "Tailored to your taste",
                      // onPressed: () => Get.to(() => const AllProducts()),
                    ),

                    const TPromoSlider(
                      banners: [
                        TImages.firstone,
                        TImages.secondone,
                        TImages.thirdone,
                      ],
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
