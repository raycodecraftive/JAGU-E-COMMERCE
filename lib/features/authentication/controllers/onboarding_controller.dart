// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:t_store/features/authentication/screens/login/login.dart';
//
// class OnBoardingController extends GetxController {
//   // Static getter to find the instance of the controller
//   static OnBoardingController get instance => Get.find();
//
//   /// PageController instance
//   final PageController pageController = PageController();
//
//   /// Reactive variable for current page index
//   Rx<int> currentPageIndex = 0.obs;
//
//   /// Update current page index when page scrolls
//   void updatePageIndicator(index) {
//     currentPageIndex.value = index;
//   }
//
//   /// Jump to the specific dot selected page.
//   void dotNavigationClick(index) {
//     currentPageIndex.value = index;
//     pageController.jumpTo(index);
//   }
//
//   /// Update current page index and jump to the next page
//   void nextPage() {
//     if (currentPageIndex.value == 2) {
//       Get.offAll(const LoginScreen());
//     } else {
//       int page = currentPageIndex.value + 1;
//       pageController.jumpToPage(page);
//     }
//   }
//
//   /// Update current page index and jump to the last page
//   void skipPage() {
//     currentPageIndex.value = 2;
//     pageController.jumpToPage(2);
//   }
//
//   isOnboardingComplete() {}
// }
