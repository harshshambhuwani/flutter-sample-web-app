import 'package:flutter/material.dart';
import 'package:flutter_testing/constants/controller_constants.dart';
import 'package:flutter_testing/root.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

/// Entry point of the application.
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  themeController.isDarkMode(Get.isDarkMode);
  await GetStorage.init();
  runApp(MyApp());
}