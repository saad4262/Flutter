import 'package:coffeeshop/utils/app_theme.dart';
import 'package:coffeeshop/view/home_screen.dart';
import 'package:coffeeshop/view/splash_screen.dart';
import 'package:coffeeshop/viewmodel/dark_mode.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(const MyApp());
}

final ThemeController themeController = Get.put(ThemeController());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        title: 'Coffee Shop',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: themeController.themeMode,
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => const SplashScreen()),
          GetPage(name: '/home', page: () => HomeScreen()), // ✅ Required
        ],
        home: SplashScreen(key: UniqueKey()),
      ),
    );
  }
}
