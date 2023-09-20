import 'package:flutter/material.dart';

class CursorProvider extends ChangeNotifier {
  Offset position = const Offset(0, 0);
  double scrollOffset = 0;
  bool isMagnified = false;
  bool hide = false;

  CursorProvider({this.position = const Offset(0, 0)});

  updatePositioned(Offset pos) {
    position = pos;
    notifyListeners();
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
