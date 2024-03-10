// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

void downloadFileFromAssets(String assetPath, String fileName) {
  // Create an anchor element
  final html.AnchorElement anchor = html.AnchorElement(href: assetPath)
    ..target = 'download'
    ..download = fileName;

  // Trigger a click event to start the download
  html.document.body!.children.add(anchor);
  anchor.click();

  // Remove the anchor element
  html.document.body!.children.remove(anchor);
}
