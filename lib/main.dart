//widget yasna3 front
import 'package:flutter/material.dart';
import 'package:flutter_application_learning/core/binding/dinding.dart';
import 'package:flutter_application_learning/screens/home/profile/login_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AllBinding(),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
