import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/constant/theme/pallete.dart';

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

  updateProjectIndex(int index, BuildContext context) {
    var cancel = BotToast.showWidget(
      toastBuilder: (cancelFunc) => Container(
        color: Palette.bgBlack.withOpacity(0.9),
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(50),
        child: Center(
          child: Container(
            width: 200,
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage('assets/png/loder_transparent.gif'),
              ),
            ),
          ),
        ),
      ),
    );
    currentProjectIndex = index;
    // var cancel = BotToast.showLoading();

    notifyListeners();
    Timer(const Duration(seconds: 3), () {
      cancel();
    });
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
