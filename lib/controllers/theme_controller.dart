import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  static ThemeController instance = Get.find();
  final _storage = GetStorage();
  final _key = 'isDarkMode';
  var isDarkMode = false.obs;
  /// Load saved theme preference
  ThemeMode get theme => _loadThemeFromStorage() ? ThemeMode.dark : ThemeMode.light;

  bool _loadThemeFromStorage() => _storage.read<bool>(_key) ?? false;

  void _saveThemeToStorage(bool isDarkMode) => _storage.write(_key, isDarkMode);

  /// Toggle Theme and Save it
  void toggleTheme() {
    bool isDark = !_loadThemeFromStorage();
    Get.changeThemeMode(isDark ? ThemeMode.dark : ThemeMode.light);
    _saveThemeToStorage(isDark);
  }
}
