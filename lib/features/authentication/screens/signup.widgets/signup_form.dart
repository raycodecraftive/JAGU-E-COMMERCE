import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/signup/terms_conditions_checkbox.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/validators/validation.dart';

class TSignupForm extends StatelessWidget {
  final TextEditingController firstName;
  final TextEditingController lastName;
  final TextEditingController username;
  final TextEditingController email;
  final TextEditingController phoneNumber;
  final TextEditingController password;

  final Key formKey;

  const TSignupForm({
    super.key,
    required this.dark,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.formKey,
    required this.password,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          /// -- First Name and Last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: firstName,
                  validator: (value) =>
                      TValidator.validateEmptyText('First name', value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: lastName,
                  validator: (value) =>
                      TValidator.validateEmptyText('Last name', value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// Username
          TextFormField(
            validator: (value) =>
                TValidator.validateEmptyText(TTexts.username, value),
            controller: username,
            expands: false,
            decoration: const InputDecoration(
              labelText: TTexts.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),

          /// Email
          TextFormField(
            validator: (value) => TValidator.validateEmail(value),
            controller: email,
            expands: false,
            decoration: const InputDecoration(
              labelText: TTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// -- Phone Number
          TextFormField(
            validator: (value) => TValidator.validatePhoneNumber(value),
            controller: phoneNumber,
            decoration: const InputDecoration(
              labelText: TTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),

          /// Password
          TextFormField(
            validator: (value) => TValidator.validatePassword(value),
            controller: password,
            expands: false,
            decoration: InputDecoration(
              labelText: TTexts.password,
              prefixIcon: const Icon(Iconsax.password_check),
              // suffixIcon: IconButton(
              //   onPressed: () => controller.hidePassword.value =
              //       !controller.hidePassword.value,
              //   icon: Icon(controller.hidePassword.value
              //       ? Iconsax.eye_slash
              //       : Iconsax.eye),
              // ),
            ),
          ),

          const SizedBox(height: TSizes.spaceBtwSections),

          /// Terms & Conditions Checkbox
          const TTermsConditionsCheckbox(),
          const SizedBox(height: TSizes.spaceBtwSections),

          /// Sign Up Button
        ],
      ),
    );
  }
}
