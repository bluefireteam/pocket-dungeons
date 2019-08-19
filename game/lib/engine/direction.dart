import 'coords.dart';

enum Direction { UP, DOWN, LEFT, RIGHT }

const Map<Direction, Coords> DELTAS = {
  Direction.UP: Coords(0, -1),
  Direction.DOWN: Coords(0, 1),
  Direction.LEFT: Coords(-1, 0),
  Direction.RIGHT: Coords(1, 0),
};