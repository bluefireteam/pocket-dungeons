import '../engine/coords.dart';
import 'enemy_type.dart';

class Dungeon {
  List<List<int>> matrix;
  Coords initialCoords;
  Map<Coords, EnemyType> enemies;

  Dungeon(this.matrix, this.initialCoords, this.enemies);
}