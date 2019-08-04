import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'direction.dart';
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

      if (!isButtonDown) {
        return;
      }

      if (keyLabel == "w") {
        gameRef.move(Direction.UP);
      } else if (keyLabel == "a") {
        gameRef.move(Direction.LEFT);
      } else if (keyLabel == "s") {
        gameRef.move(Direction.DOWN);
      } else if (keyLabel == "d") {
        gameRef.move(Direction.RIGHT);
      } else if (keyLabel == "i") {
        gameRef.attack(Direction.UP);
      } else if (keyLabel == "j") {
        gameRef.attack(Direction.LEFT);
      } else if (keyLabel == "k") {
        gameRef.attack(Direction.DOWN);
      } else if (keyLabel == "l") {
        gameRef.attack(Direction.RIGHT);
      } else if (keyId == ENTER_KEY_ID) {
        gameRef.select();
      }
    });
  }
}
