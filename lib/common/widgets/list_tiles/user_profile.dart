import 'package:flutter/material.dart';
import 'package:t_store/features/authentication/screens/address/widgets/profile.dart';
import 'package:t_store/features/shop/images/t_circular_image.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';

class TUserProfileTile extends StatelessWidget {
  final Future? Function()? onPressed; // Updated this to be nullable

  const TUserProfileTile({
    super.key,
    this.onPressed, // Updated to match the field
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const TCircularImage(
        image: TImages.acerlogo,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: const Text(
        'Coding With Ray',
        style: TextStyle(
          color: TColors.black,
          fontSize: 20, // Adjust the size as needed
        ),
      ),
      trailing: IconButton(
        onPressed: onPressed ??
            () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                ),
        icon: const Icon(Icons.edit,
            color: TColors.black), // Fixed Icon reference
      ),
    );
  }
}
