import 'package:flame/components/resizable.dart';

import 'game.dart';

class Camera extends Resizable {

  MyGame gameRef;

  Camera(this.gameRef);

  void handle(double dt) {
    if (gameRef.player == null) {
      return;
    }

    gameRef.camera.x = gameRef.player.x - size.width / 2 + gameRef.player.width / 2;
    gameRef.camera.y = gameRef.player.y - size.height / 2 + gameRef.player.height / 2;
  }
}