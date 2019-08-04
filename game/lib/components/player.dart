import 'dart:ui';

import 'package:flame/animation.dart';
import 'package:flame/components/component.dart';
import 'package:flame/position.dart';
import 'package:flame/sprite.dart';
import 'package:pocket_dungeons/direction.dart';
import 'package:pocket_dungeons/utils.dart';

class Player extends PositionComponent {

  Sprite stillSprite = Sprite('player.png', x: 0, y: 7, width: 15, height: 20);
  Animation moveAnimation = Animation.sequenced('player.png', 9, textureWidth: 16.0, textureHeight: 27.0);

  Player(Position start) {
    x = start.x;
    y = start.y;
  }

  @override
  void render(Canvas c) {
    prepareCanvas(c);
    c.translate(2, 2);
    stillSprite.render(c, width: TILE_SIZE - 4, height: TILE_SIZE - 4);
  }

  @override
  void update(double t) {
  }

  @override
  int priority() => 1;

  void move(Direction direction) {
    List<int> delta = DELTAS[direction];
    x += delta[0] * TILE_SIZE;
    y += delta[1] * TILE_SIZE;
  }

  void attack(Direction direction) {}
}