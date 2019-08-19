import 'dart:math' show Random;

import '../components/player.dart';

import '../components/actor.dart';
import '../game.dart';
import 'action.dart';
import 'direction.dart';

class Engine {

  Random random;
  MyGame gameRef;

  Engine(this.random, this.gameRef);

  Iterable<Actor> get actors => gameRef.queryComponents.actors();

  void queue(Action action) {
    actors.forEach((a) {
      a.queue(a is Player ? action : randomMove());
    });
  }

  Action randomMove() {
    return Action.move(randomDir());
  }

  Direction randomDir() {
    return Direction.values[random.nextInt(Direction.values.length)];
  }
}