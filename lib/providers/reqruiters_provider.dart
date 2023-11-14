import 'package:flutter/material.dart';

class RecruitersProvider extends ChangeNotifier {
  Offset position = const Offset(0, 0);
  Offset cursorPosition = const Offset(0, 0);
  double scrollOffset = 0;
  bool isMagnified = false;
  bool hide = false;

  RecruitersProvider();

  updatePositioned(Offset pos) {
    position = pos;
    notifyListeners();
  }

  updateCursorPosition(Offset pos) {
    cursorPosition = pos;
    // notifyListeners();
  }

  toggleMagnify(bool val) {
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
