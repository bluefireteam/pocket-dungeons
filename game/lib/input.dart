import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'game.dart';

class Input {

  static const ENTER_KEY_ID = 4295426088;

  MyGame gameRef;

  Input(this.gameRef);

  void attach() {
    RawKeyboard.instance.addListener((RawKeyEvent e) {
      final bool isButtonDown = e is RawKeyDownEvent;
      final keyLabel = e.data.logicalKey.keyLabel;
      int keyId = e.data.logicalKey.keyId;

      if (keyLabel == "w") {
        if (gameRef.page != null) {
          if (isButtonDown) {
            gameRef.page.up();
          }
        } else {
          // TODO
        }
      } else if (keyLabel == "a") {
        // TODO
      } else if (keyLabel == "s") {
        if (gameRef.page != null) {
          if (isButtonDown) {
            gameRef.page.down();
          }
        } else {
          // TODO
        }
      } else if (keyLabel == "d") {
        // TODO        
      } else if (keyLabel == "i") {
        // TODO
      } else if (keyLabel == "j") {
        // TODO
      } else if (keyLabel == "k") {
        // TODO
      } else if (keyLabel == "l") {
        // TODO
      } else if (keyId == ENTER_KEY_ID) {
        if (gameRef.page != null) {
          if (isButtonDown) {
            gameRef.page.select();
          }
        } else {
          // TODO
        }
      }
    });
  }
}
