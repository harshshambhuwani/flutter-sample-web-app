import 'package:flutter_testing/constants/controller_constants.dart';
import 'package:flutter_testing/controllers/app_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class MyHomePage extends StatelessWidget {
  final AppController controller = Get.put(AppController());

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          if (controller.isMenuOpen.value) {
            controller.closeMenu();
          }
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Obx(
                          () => IconButton(
                        icon: Icon(themeController.isDarkMode.value
                            ? Icons.light_mode
                            : Icons.dark_mode),
                        onPressed: () {
                          themeController.toggleTheme();
                          themeController.isDarkMode(Get.isDarkMode);
                        },
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: controller.urlController,
                        decoration: const InputDecoration(
                          hintText: 'Enter image URL',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: controller.loadImage,
                      child: const Text('Load Image'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Obx(() {
                if (controller.imageUrl.value.isNotEmpty &&
                    controller.imageViewId.value.isNotEmpty) {
                  return SizedBox(
                    width: Get.width * 0.5,
                    height: Get.height * 0.5,
                    child: controller.htmlImageView,
                  );
                } else {
                  return const SizedBox.shrink();
                }
              }),
            ],
          ).paddingSymmetric(vertical: 35),
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Colors.blue,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.fullscreen),
            label: 'Enter Fullscreen',
            onTap: () {
              controller.enterFullscreenAction();
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.fullscreen_exit),
            label: 'Exit Fullscreen',
            onTap: () {
              controller.exitFullscreenAction();
            },
          ),
        ],
      ),
    );
  }
}
