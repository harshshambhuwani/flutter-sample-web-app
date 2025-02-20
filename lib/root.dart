import 'package:flutter/material.dart';
import 'package:flutter_testing/bindings/main_bindings.dart';
import 'package:flutter_testing/constants/controller_constants.dart';
import 'package:flutter_testing/themes/app_themes.dart';
import 'package:get/get.dart';
import 'screens/main/home/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: MainBindings(),
      title: 'Flutter Demo',
      themeMode: themeController.theme,
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      home:  MyHomePage(),
    );
  }
}