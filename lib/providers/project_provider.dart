import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

class ProjectProvider extends ChangeNotifier {
  int currentProjectIndex = 0;
  Offset position = const Offset(0, 0);
  // Offset cursorPosition = const Offset(0, 0);
  double scrollOffset = 0;
  bool isMagnified = false;
  bool fullMagnify = false;
  bool hide = false;

  ProjectProvider({this.position = const Offset(0, 0)});

  updatePosition(Offset pos) {
    position = pos;
    notifyListeners();
  }

  updateProjectIndex(int index) {
    currentProjectIndex = index;
    var cancel = BotToast.showCustomLoading(
      toastBuilder: (cancelFunc) => Container(
        child: Center(
          child: Image.asset('assets/png/loader.gif'),
        ),
      ),
    );
    notifyListeners();
    Timer(const Duration(seconds: 2), () => cancel());
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
