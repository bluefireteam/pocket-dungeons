import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart' hide Action;

import 'engine/action.dart';
import 'engine/direction.dart';
import 'game.dart';

class Input {

  static const ENTER_KEY_ID = 4295426088;
  static const SPACE_KEY_ID = 32;

  MyGame gameRef;

  Input(this.gameRef);

  void attach() {
    RawKeyboard.instance.addListener((RawKeyEvent e) {
      final bool isButtonDown = e is RawKeyDownEvent;
      final keyLabel = e.data.logicalKey.keyLabel;
      int keyId = e.data.logicalKey.keyId;

      print(keyId);

      if (!isButtonDown) {
        return;
      }

      if (keyLabel == "w") {
        gameRef.act(Action.move(Direction.UP));
      } else if (keyLabel == "a") {
        gameRef.act(Action.move(Direction.LEFT));
      } else if (keyLabel == "s") {
        gameRef.act(Action.move(Direction.DOWN));
      } else if (keyLabel == "d") {
        gameRef.act(Action.move(Direction.RIGHT));
      } else if (keyLabel == "i") {
        gameRef.act(Action.attack(Direction.UP));
      } else if (keyLabel == "j") {
        gameRef.act(Action.attack(Direction.LEFT));
      } else if (keyLabel == "k") {
        gameRef.act(Action.attack(Direction.DOWN));
      } else if (keyLabel == "l") {
        gameRef.act(Action.attack(Direction.RIGHT));
      } else if (keyId == SPACE_KEY_ID) {
        gameRef.act(Action.idle());
      } else if (keyId == ENTER_KEY_ID) {
        gameRef.select();
      }
    });
  }
}
