import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';
import 'package:t_store/features/authentication/viewmodels/auth_viewmodel.dart';
import 'package:t_store/utils/theme/theme.dart';

/// -- Entry point of Flutter App
Future<void> main() async {
  ///Widgets Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  /// -- Initialize Firebase & Authentication Repository

  // Initialize Authentication Repository with GetX
  // Get.put(AuthenticationRepository());

  /// -- Load all the material design / themes / localizations/ bindings
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AuthViewModel()),
    ],
    child: Directionality(
      textDirection: TextDirection.ltr,
      child: MaterialApp(
        theme: TAppTheme.lightTheme,
        home: LoginScreen(),
      ),
    ),
  ));
}
