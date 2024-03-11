// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

void downloadFileFromAssets(String assetPath, String fileName) {
  html.window.open(assetPath, 'PlaceholderName');
  // // Create an anchor element
  // final html.AnchorElement anchor = html.AnchorElement(href: assetPath)
  //   // ..target = 'download'
  //   ..download = fileName;

  // // Add the anchor element to the document body
  // html.document.body!.children.add(anchor);

  // // Trigger a click event to start the download
  // anchor.click();

  // // Remove the anchor element after the download starts
  // html.document.body!.children.remove(anchor);
}
