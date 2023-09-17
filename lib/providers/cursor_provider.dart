import 'dart:developer';

import 'package:flutter/material.dart';

class CursorProvider extends ChangeNotifier {
  Offset position = const Offset(0, 0);
  bool isMagnified = false;

  CursorProvider({this.position = const Offset(0, 0)});

  updatePositioned(Offset pos) {
    position = pos;
    notifyListeners();
  }

  toggleMagnify(bool val) {
    isMagnified = val;
    log("Toggled state : $isMagnified");
    notifyListeners();
  }
}
