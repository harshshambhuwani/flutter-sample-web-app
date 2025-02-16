import 'dart:html' as html;
import 'dart:js' as js;
import 'dart:ui' as ui;

/// Enters fullscreen mode using a JavaScript call.
void enterFullscreen() {
  js.context.callMethod('enterFullscreen');
}

/// Exits fullscreen mode using a JavaScript call.
void exitFullscreen() {
  js.context.callMethod('exitFullscreen');
}

/// Toggles between fullscreen and windowed mode.
void toggleFullscreen() {
  js.context.callMethod('toggleFullscreen');
}

/// Registers an HTML view that displays an image.
/// This function creates an <img> element with a double-click listener for toggling fullscreen.
void registerImageView(String viewId, String imageUrl) {
  // ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(viewId, (int viewId) {
    final img = html.ImageElement()
      ..src = imageUrl
      ..style.width = '100%'
      ..style.height = 'auto'
      ..style.objectFit = 'contain';

    // Double-clicking the image toggles fullscreen.
    img.onDoubleClick.listen((event) {
      toggleFullscreen();
    });
    return img;
  });
}
