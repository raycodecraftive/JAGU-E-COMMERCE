import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/personalization/screens/settings/settings.dart';
import 'package:t_store/features/shop/views/screens/home/home.dart';
import 'package:t_store/features/shop/views/store/store.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import 'features/authentication/screens/wishlist/wishlist.dart';
import 'utils/validators/sendtolk.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  final screens = [
    const HomeScreen(),
    const Store(),
    const Sendtolk(),
    const FavouriteScreen(),
    const SettingsScreen(),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          height: 80,
          elevation: 0,
          backgroundColor: darkMode ? TColors.black : Colors.white,
          indicatorColor: darkMode
              ? TColors.white.withOpacity(0.1)
              : TColors.success.withOpacity(0.1),
          destinations: const [
            NavigationDestination(
                icon: Icon(Iconsax.home, color: Colors.green), label: 'Home'),
            NavigationDestination(
                icon: Icon(Iconsax.shop, color: Colors.green), label: 'Store'),
            NavigationDestination(
                icon: Icon(Iconsax.airplane, color: Colors.green),
                label: 'Send to LK '),
            NavigationDestination(
                icon: Icon(Iconsax.heart, color: Colors.green),
                label: 'Wishlist'),
            NavigationDestination(
                icon: Icon(Iconsax.user, color: Colors.green),
                label: 'Profile'),
          ],
        ),
        body: screens[selectedIndex]);
  }
}

// class NavigationController extends GetxController {
//   final Rx<int> selectedIndex = 0.obs;
//
//   final screens = [
//     const HomeScreen(),
//     const Store(),
//     const Sendtolk(),
//     const FavouriteScreen(),
//     const SettingsScreen(),
//   ];
// }
