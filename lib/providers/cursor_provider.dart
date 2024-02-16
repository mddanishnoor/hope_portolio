import 'package:flutter/material.dart';

class CursorProvider extends ChangeNotifier {
  Offset position = const Offset(0, 0);
  // Offset cursorPosition = const Offset(0, 0);
  double scrollOffset = 0;
  bool isMagnified = false;
  bool fullMagnify = false;
  bool hide = false;

  CursorProvider({this.position = const Offset(0, 0)});

  updatePositioned(Offset pos) {
    position = pos;
    notifyListeners();
  }

  // updateCursorPosition(Offset pos) {
  //   cursorPosition = pos;
  //   // notifyListeners();
  // }

  toggleMagnify(bool val, {bool? fullScreen}) {
    if (fullScreen != null) {
      fullMagnify = fullScreen;
      // cursorPosition = const Offset(1, 1);
    }
    isMagnified = val;
    notifyListeners();
  }

  toggleHide(bool val) {
    hide = val;
    notifyListeners();
  }

  updateScrollOffset(double offset) {
    scrollOffset = offset;
    notifyListeners();
  }
}
