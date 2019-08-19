import 'action_type.dart';
import 'direction.dart';

class Action {
  ActionType type;
  Direction direction;

  Action(this.type, this.direction);
  Action.move(this.direction) : this.type = ActionType.MOVE;
  Action.attack(this.direction) : this.type = ActionType.ATTACK;
  Action.idle() : this.type = ActionType.IDLE;
}