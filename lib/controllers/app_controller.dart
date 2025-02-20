import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/fullscreen_util.dart';

/// AppController handles the state and actions for the application.
class AppController extends GetxController {
  /// The URL of the image to display.
  var imageUrl = ''.obs;
  final isFullscreen = false.obs;
  /// A unique view ID for the registered HTML view.
  var imageViewId = ''.obs;

  /// Controls the visibility of the context menu.
  var isMenuOpen = false.obs;

  /// Controller for the URL input field.
  final urlController = TextEditingController();

  /// Widget that holds the HTML image view (only works on web).
  Widget htmlImageView = const SizedBox.shrink();

  /// Loads the image from the URL and registers an HTML view if on web.
  void loadImage() {
    if (urlController.text.isNotEmpty) {
      imageUrl.value = urlController.text;
      imageViewId.value =
      'image-view-${DateTime.now().millisecondsSinceEpoch}';

      // On web, register an HTML view.
      if (kIsWeb) {
        // registerImageView is conditionally imported.
        registerImageView(imageViewId.value, imageUrl.value);
        // Create an HtmlElementView with the registered view type.
        htmlImageView = SizedBox(

          width: Get.width * 0.5,
          height: Get.height * 0.5,
          child: HtmlElementView(
            viewType: imageViewId.value,
          ),
        );
      }
    }
  }

  /// Toggles the context menu visibility.
  void toggleMenu() {
    isMenuOpen.value = !isMenuOpen.value;
  }

  /// Closes the context menu.
  void closeMenu() {
    isMenuOpen.value = false;
  }

  /// Calls the platform-specific function to enter fullscreen mode.
  void enterFullscreenAction() {
    isFullscreen(true);
    enterFullscreen();
  }

  /// Calls the platform-specific function to exit fullscreen mode.
  void exitFullscreenAction() {
    if(isFullscreen.value){
      isFullscreen(false);
      exitFullscreen();
    }else{
      Get.defaultDialog(
        title: "Alert",
        middleText: "Already in normal mode!",
        textConfirm: "OK",
        onConfirm: () => Get.back(),
      );
    }
  }
}
