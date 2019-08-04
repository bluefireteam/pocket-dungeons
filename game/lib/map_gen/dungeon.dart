import 'package:flame/position.dart';

import '../utils.dart';

class Dungeon {
  List<List<int>> matrix;
  List<int> initialCoords;

  Dungeon(this.matrix, this.initialCoords);

  Position get initialPosition => Position(TILE_SIZE * initialCoords[0], TILE_SIZE * initialCoords[1]);
}