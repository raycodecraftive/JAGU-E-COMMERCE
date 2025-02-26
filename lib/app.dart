import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';

//// -- Use this class to setup themes , intial Bindings

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: TColors.primary,
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
