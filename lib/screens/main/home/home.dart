
import 'package:flutter_testing/controllers/app_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
class MyHomePage extends StatelessWidget {
  final AppController controller = Get.put(AppController());

   MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Capture taps to close the context menu if it’s open.
      body: GestureDetector(
        onTap: () {
          if (controller.isMenuOpen.value) {
            controller.closeMenu();
          }
        },
        child: Stack(
          children: [
            // Main content area (centered URL input and image view)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // URL input field and load button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
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
                  // Display the image if a URL has been provided.
                  Obx(() {
                    if (controller.imageUrl.value.isNotEmpty &&
                        controller.imageViewId.value.isNotEmpty) {
                      return Container(
                        width: 300,
                        height: 300,
                        // Only works on web; on mobile the container will be empty.
                        child: controller.htmlImageView,
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  }),
                ],
              ),
            ),
            // Floating Plus button and context menu.
            Positioned(
              bottom: 20,
              right: 20,
              child: Obx(() {
                return Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    // Dimmed background overlay when menu is open.
                    if (controller.isMenuOpen.value)
                      GestureDetector(
                        onTap: controller.closeMenu,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (controller.isMenuOpen.value) ...[
                          ElevatedButton(
                            onPressed: () {
                              controller.enterFullscreenAction();
                              controller.closeMenu();
                            },
                            child: const Text('Enter fullscreen'),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              controller.exitFullscreenAction();
                              controller.closeMenu();
                            },
                            child: const Text('Exit fullscreen'),
                          ),
                          const SizedBox(height: 10),
                        ],
                        FloatingActionButton(
                          onPressed: controller.toggleMenu,
                          child: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}