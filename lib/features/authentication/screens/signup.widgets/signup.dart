import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:t_store/features/authentication/screens/signup.widgets/signup_form.dart';
import 'package:t_store/features/authentication/viewmodels/auth_viewmodel.dart';
import 'package:t_store/otp_screen.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import 'package:t_store/utils/helpers/toast.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phoneNumber;
  late TextEditingController password;

  @override
  void initState() {
    firstName = TextEditingController();
    lastName = TextEditingController();
    username = TextEditingController();
    email = TextEditingController();
    phoneNumber = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    username.dispose();
    email.dispose();
    phoneNumber.dispose();
    password.dispose();

    super.dispose();
  }

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<AuthViewModel>(builder: (context, snapshot, _) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Title
                Text(TTexts.signupTitle,
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: TSizes.spaceBtwSections),

                /// Form
                TSignupForm(
                  dark: dark,
                  firstName: firstName,
                  lastName: lastName,
                  email: email,
                  password: password,
                  phoneNumber: phoneNumber,
                  username: username,
                  formKey: formKey,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        snapshot.register(
                            email: email.text,
                            password: password.text,
                            onSuccess: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OtpScreen(),
                                ),
                              );
                              //   TODO  : Navigate them to otp verification UI
                            },
                            onError: () {
                              ToastHelper.error(snapshot.authErrorMessage);
                              // Show Error
                            },
                            firstName: firstName.text,
                            lastName: lastName.text,
                            phoneNumber: phoneNumber.text,
                            username: username.text);
                      }
                    },
                    child: snapshot.isRegistering
                        ? const CupertinoActivityIndicator(
                            color: Colors.white,
                          )
                        : const Text(TTexts.createAccount),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),

                /// Divider

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                        child: Divider(
                            color: dark ? TColors.darkGrey : TColors.grey,
                            thickness: 0.5,
                            indent: 60,
                            endIndent: 5)),
                    Text(TTexts.orSignInWith,
                        style: Theme.of(context).textTheme.labelMedium),
                    Flexible(
                        child: Divider(
                            color: dark ? TColors.darkGrey : TColors.grey,
                            thickness: 0.5,
                            indent: 5,
                            endIndent: 60)),
                  ],
                ),

                /// Social Buttons
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
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
