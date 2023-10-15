import 'package:flutter/material.dart';

class ProjectProvider extends ChangeNotifier {
  Offset position = const Offset(0, 0);
  Offset cursorPosition = const Offset(0, 0);
  double scrolloffset = 0;

  bool isMagnified = false;
  bool hide = false;

  ProjectProvider();

  updatePosition(Offset pos) {
    position = pos;
    notifyListeners();
  }

  updateCursorPositio(Offset pos) {
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
    scrolloffset = offset;
    notifyListeners();
  }
}
