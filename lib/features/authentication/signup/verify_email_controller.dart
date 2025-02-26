// import 'dart:async';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:t_store/common/widgets/success_screen/success_screen.dart';
// import 'package:t_store/data/repositories/repositories.authentication/authentication_repository.dart';
// import 'package:t_store/features/shop/utils/popups/loaders.dart';
// import 'package:t_store/utils/constants/image_strings.dart';
// import 'package:t_store/utils/constants/text_strings.dart';
//
// class VerifyEmailController extends GetxController {
//   static VerifyEmailController get instance => Get.find();
//
//   /// -- Static Email whenever Verify Screen Appears & Set Timer for Auto Direct
//   @override
//   void onInit() {
//     setTimerForAutoRedirect();
//     super.onInit();
//   }
//
//   /// -- Send Email Verification Link
//   sendEmailVerification() async {
//     try {
//       await AuthenticationRepository.instance.sendEmailVerification();
//       TLoaders.successSnackBar(
//           title: 'Email Sent',
//           message: 'Please Check your inbox and verify your email');
//     } catch (e) {
//       TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
//     }
//   }
//
//   /// Timer to Automatically redirect on Email Verification
//   setTimerForAutoRedirect() {
//     Timer.periodic(
//       const Duration(seconds: 1),
//       (timer) async {
//         await FirebaseAuth.instance.currentUser?.reload();
//         final user = FirebaseAuth.instance.currentUser;
//         if (user?.emailVerified ?? false) {
//           timer.cancel();
//           Get.off(
//             () => SuccessScreen(
//               image: TImages.successfullyRegisterAnimation,
//               title: TTexts.yourAccountCreatedTitle,
//               subTitle: TTexts.yourAccountCreatedSubTitle,
//               onPressed: () =>
//                   AuthenticationRepository.instance.screenRedirect(),
//             ),
//           );
//         }
//       },
//     );
//   }
//
//   /// Manually Check if Email is verified
//   checkEmailVerificationStatus() async {
//     final currentUser = FirebaseAuth.instance.currentUser;
//     if (currentUser != null && currentUser.emailVerified) {
//       Get.off(
//         () => SuccessScreen(
//           image: TImages.successfullyRegisterAnimation,
//           title: TTexts.yourAccountCreatedTitle,
//           subTitle: TTexts.yourAccountCreatedSubTitle,
//           onPressed: () => AuthenticationRepository.instance.screenRedirect(),
//         ),
//       );
//     }
//   }
// }
