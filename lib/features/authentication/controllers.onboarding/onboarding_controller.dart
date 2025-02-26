// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:t_store/features/authentication/screens/login/login.dart';
//
// class OnboardingController extends GetxController {
//   static OnboardingController get instance => Get.find();
//
//   /// variables
//   final pageController = PageController();
//   Rx<int> currentPageIndex = 0.obs;
//
//   /// update Current Index when Page Scroll
//   void updatePageIndicator(index) => currentPageIndex.value = index;
//
//   /// Jump to the specific dot selected page.s
//
//   void dotNavigationClick(index) {
//     currentPageIndex.value = index;
//     pageController.jumpTo(index);
//   }
//
//   /// Update Current index and Jump to the next page
//   void nextPage() {
//     if (currentPageIndex.value == 2) {
//       final storage = GetStorage();
//
//       if (kDebugMode) {
//         print('=============== GET STORAGE Next Button========');
//         print(storage.read('IsFirstTime'));
//       }
//       storage.write('IsFirstTime', false);
//
//       Get.offAll(const LoginScreen());
//     } else {
//       int page = currentPageIndex.value + 1;
//
//       pageController.jumpToPage(page);
//     }
//   }
//
//   /// Update Current Index and Jump to the last page
//   void skipPage() {
//     currentPageIndex.value = 2;
//     pageController.jumpToPage(2);
//   }
// }
