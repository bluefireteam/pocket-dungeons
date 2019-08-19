import 'dart:ui';

import '../engine/direction.dart';
import '../game.dart';

abstract class Page {
  MyGame gameRef;
  Size size;

  Page(this.gameRef) {
    size = gameRef.size;
  }

  void render(Canvas c);
  void update(double dt);

  void move(Direction d) {}
  void select() {}
}