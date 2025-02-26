import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:t_store/common/styles/spacing_styles.dart';
import 'package:t_store/features/authentication/screens/signup.widgets/signup.dart';
import 'package:t_store/features/authentication/viewmodels/auth_viewmodel.dart';
import 'package:t_store/features/password_configuration/forget_password.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import 'package:t_store/utils/helpers/toast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: Consumer<AuthViewModel>(builder: (context, snapshot, _) {
        return SingleChildScrollView(
          child: Padding(
            padding: TSpacingStyle.paddingWithBarHeight,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
              child: Column(
                children: [
                  ///  Logo , Title & Sub - Title
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(
                        height: 150,
                        image: AssetImage(dark
                            ? TImages.splashAppLogo
                            : TImages.splashAppLogo),
                      ),
                      Text(TTexts.loginTitle,
                          style: Theme.of(context).textTheme.headlineMedium),
                      const SizedBox(
                        height: TSizes.sm,
                      ),
                      Text(TTexts.loginSubTitle,
                          style: Theme.of(context).textTheme.bodyMedium),
                      const SizedBox(height: TSizes.spaceBtwInputFields),
                    ],
                  ),

                  /// Form
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        /// Email
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please fill up this field';
                            }
                            return null;
                          },
                          controller: _emailController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.direct_right),
                            labelText: TTexts.email,
                          ),
                        ),
                        const SizedBox(height: TSizes.spaceBtwInputFields),

                        /// Password
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please fill up this field';
                            }
                            return null;
                          },
                          controller: _passwordController,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.password_check),
                              labelText: TTexts.password,
                              suffixIcon: Icon(Iconsax.eye_slash)),
                        ),
                        const SizedBox(height: TSizes.spaceBtwInputFields / 2),

                        /// Remember me & Forget Password
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /// Remember me
                            Row(
                              children: [
                                Checkbox(value: true, onChanged: (value) {}),
                                const Text(TTexts.rememberMe),
                              ],
                            ),

                            /// Forget Password
                            TextButton(
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ForgetPassword(),
                                ),
                              ),
                              child: const Text(TTexts.forgetPassword),
                            )
                          ],
                        ),
                        const SizedBox(height: TSizes.spaceBtwSections),

                        // Sign in Button
                        SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () {
                                  print("Email: ${_emailController.text}");
                                  print(
                                      "Password: ${_passwordController.text}");

                                  print(_formKey.currentState!.validate());
                                  if (_formKey.currentState!.validate()) {
                                    snapshot.login(
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                        onSuccess: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const NavigationMenu(),
                                            ),
                                          );
                                        },
                                        onError: () {
                                          ToastHelper.error(
                                            snapshot.authErrorMessage,
                                          );
                                        });
                                  }
                                },
                                // Get.to(() => const NavigationMenu()),
                                child: const Text(TTexts.signIn))),
                        const SizedBox(height: TSizes.spaceBtwItems),

                        // Create Account Button
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignupScreen(),
                                ),
                              );
                            },
                            child: const Text(TTexts.createAccount),
                          ),
                        ),
                        const SizedBox(height: TSizes.spaceBtwSections),
                      ],
                    ),
                  ),

                  /// Divider
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                          child: Divider(
                              color: dark ? TColors.darkGrey : Colors.red,
                              thickness: 0.5,
                              indent: 60,
                              endIndent: 5)),
                      Text(TTexts.orSignInWith,
                          style: Theme.of(context).textTheme.labelMedium),
                      Flexible(
                          child: Divider(
                              color: dark ? TColors.darkGrey : Colors.red,
                              thickness: 0.5,
                              indent: 5,
                              endIndent: 60)),
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  /// Footer
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: TColors.grey),
                              borderRadius: BorderRadius.circular(100)),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Image(
                              width: TSizes.iconMd,
                              height: TSizes.iconMd,
                              image: AssetImage(TImages.google),
                            ),
                          )),
                      const SizedBox(width: TSizes.spaceBtwItems),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: TColors.grey),
                            borderRadius: BorderRadius.circular(100)),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Image(
                            width: TSizes.iconMd,
                            height: TSizes.iconMd,
                            image: AssetImage(TImages.facebook),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
