import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';
import 'package:t_store/features/user/viewmodel/user.viewmodel.dart';
import 'package:t_store/navigation_menu.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UserViewModel>().getUser(
      () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => NavigationMenu()));
      },
      () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
