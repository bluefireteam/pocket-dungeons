enum Direction { UP, DOWN, LEFT, RIGHT }

const Map<Direction, List<int>> DELTAS = {
  Direction.UP: [0, -1],
  Direction.DOWN: [0, 1],
  Direction.LEFT: [-1, 0],
  Direction.RIGHT: [1, 0],
};