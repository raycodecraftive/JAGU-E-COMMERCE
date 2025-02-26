// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:t_store/data/repositories/repositories.authentication/authentication_repository.dart';
// import 'package:t_store/data/repositories/repositories.authentication/user/user_model.dart';
// import 'package:t_store/data/repositories/repositories.authentication/user/user_repositories.dart';
// import 'package:t_store/features/authentication/screens/signup.widgets/verify_email.dart';
// import 'package:t_store/features/shop/utils/helpers/network_manager.dart';
// import 'package:t_store/features/shop/utils/popups/full_screen_loader.dart';
// import 'package:t_store/features/shop/utils/popups/loaders.dart';
// import 'package:t_store/utils/constants/image_strings.dart';
//
// class SignupController extends GetxController {
//   SignupController();
//
//   /// -- Variables
//   final hidePassword = true.obs;
//   final privacyPolicy = true.obs;
//
//   /// Observable for hiding/ showing password
//
//   final email = TextEditingController(); // Controller for Email input
//   final lastName = TextEditingController(); // Controller For Last name
//   final username = TextEditingController(); // Controller for username input
//   final password = TextEditingController(); // Controller For Password Input
//   final firstName = TextEditingController(); // Controller for first name Input
//   final phoneNumber =
//       TextEditingController(); // Controller for phone number input
//   GlobalKey<FormState> signupFormKey =
//       GlobalKey<FormState>(); // Form Key for form validation
//
//   /// -- Signup
//   void signup() async {
//     try {
//       // Start Loading
//       TFullScreenLoader.openLoadingDialog(
//           'We are processing your information...', TImages.onBoardingImage3);
//
//       // Check Internet Connectivity
//       final isConnected = await NetworkManager.instance.isConnected();
//       if (!isConnected) {
//         ///-- Remove Loader
//         TFullScreenLoader.stopLoading();
//         return;
//       }
//
//       // Form Validation
//       if (!signupFormKey.currentState!.validate()) {
//         /// Remove Loader
//         TFullScreenLoader.stopLoading();
//         return;
//       }
//
//       // Privacy Policy Check
//       if (!privacyPolicy.value) {
//         TLoaders.warningSnackBar(
//           title: 'Accept Privacy Policy',
//           message:
//               'To create an account, you must accept the Privacy Policy & Terms of Use.',
//         );
//         return;
//       }
//
//       // Register user in Firebase Authentication & Save user data in Firebase
//       final userCredential = await AuthenticationRepository.instance
//           .registerWithEmailAndPassword(
//               email.text.trim(), password.text.trim());
//
//       // Save authenticated user data in Firebase Firestore
//       final newUser = UserModel(
//         id: userCredential.user!.uid,
//         firstName: firstName.text.trim(),
//         lastName: lastName.text.trim(),
//         username: username.text.trim(),
//         email: email.text.trim(),
//         phoneNumber: phoneNumber.text.trim(),
//         profilePicture: '',
//       );
//
//       final userRepository = Get.put(UserRepository());
//       await userRepository.saveUserRecord(newUser);
//
//       // Remove Loader
//       TFullScreenLoader.stopLoading();
//
//       // Show Success Message
//       TLoaders.successSnackBar(
//           title: 'Congratulations',
//           message:
//               'Your account has been created! Verify your email to continue.');
//
//       /// Move to Verify Email Screen
//       Get.to(() => VerifyEmailScreen(
//             email: email.text.trim(),
//           ));
//     } catch (e) {
//       // Show a Generic Error to the user
//       TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
//     } finally {
//       // Remove Loader
//       TFullScreenLoader.stopLoading();
//     }
//   }
// }
