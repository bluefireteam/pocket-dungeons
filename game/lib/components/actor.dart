import 'package:flame/components/component.dart';

import '../engine/action.dart';
import '../engine/action_type.dart';
import '../engine/coords.dart';
import '../engine/direction.dart';
import '../utils.dart';

abstract class Actor extends PositionComponent {

  List<Action> actions = [];
  Action currentAction;
  double clock;

  Coords coords;
  double movingX = 0.0, movingY = 0.0;

  double get x => TILE_SIZE * coords.x + movingX;
  double get y => TILE_SIZE * coords.y + movingY;

  Actor(this.coords);

  void queue(Action a) {
    actions.add(a);
  }

  bool get acting => currentAction != null;

  @override
  void update(double dt) {
    if (currentAction == null) {
      resetAction();
    }
    if (currentAction != null) {
      clock += dt;
      step();
      if (clock >= ACTION_TIME) {
        finish();
        resetAction();
      }
    }
  }

  void resetAction() {
    currentAction = actions.isNotEmpty ? actions.removeAt(0) : null;
    clock = 0;
  }

  void step() {
    if (currentAction.type == ActionType.MOVE) {
      moveStep(currentAction.direction);
    } else if (currentAction.type == ActionType.ATTACK) {
      attackStep(currentAction.direction);
    }
  }

  void moveStep(Direction direction) {
    Coords delta = DELTAS[direction];
    movingX = delta.x * TILE_SIZE * clock / ACTION_TIME;
    movingY = delta.y * TILE_SIZE * clock / ACTION_TIME;
  }

  void attackStep(Direction direction) {
    // TODO
  }

  void finish() {
    if (currentAction.type == ActionType.MOVE) {
      moveFinish(currentAction.direction);
    } else if (currentAction.type == ActionType.ATTACK) {
      attackFinish(currentAction.direction);
    }
  }

  void moveFinish(Direction direction) {
    Coords delta = DELTAS[direction];
    coords = coords.add(delta);
    movingX = movingY = 0;
  }

  void attackFinish(Direction direction) {
    // TODO
  }
}