import 'dart:ui';

import 'package:flame/animation.dart';
import 'package:flame/sprite.dart';

import '../engine/coords.dart';
import '../utils.dart';
import 'actor.dart';

class AnimatedActorConfig {
  String textureName;
  int width;
  int height;
  int frames;
  AnimatedActorConfig(this.textureName, { this.frames, this.width, this.height });
}

abstract class AnimatedActor extends Actor {

  Sprite stillSprite;
  Animation moveAnimation;

  AnimatedActor(Coords coords) : super(coords) {
    AnimatedActorConfig c = config();
    double w = c.width.toDouble();
    double h = c.height.toDouble();
    double stepTime = ACTION_TIME / c.frames;
    stillSprite = Sprite(c.textureName, x: 0, y: 0, width: w, height: h);
    moveAnimation = Animation.sequenced(c.textureName, c.frames, textureWidth: w, textureHeight: h)..stepTime = stepTime;
  }

  AnimatedActorConfig config();

  @override
  void update(double dt) {
    super.update(dt);
    if (acting) moveAnimation.update(dt);
  }

  @override
  void render(Canvas c) {
    prepareCanvas(c);
    Sprite sprite = acting ? moveAnimation.getSprite() : stillSprite;
    sprite.render(c, width: TILE_SIZE, height: TILE_SIZE);
  }

  @override
  void resetAction() {
    super.resetAction();
    moveAnimation.reset();
  }

  @override
  int priority() => 1;
}