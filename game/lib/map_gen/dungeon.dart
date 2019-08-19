import '../engine/coords.dart';
import '../engine/matrix.dart';
import 'enemy_type.dart';

class Dungeon {
  Matrix<int> matrix;
  Coords initialCoords;
  Map<Coords, EnemyType> enemies;

  Dungeon(this.matrix, this.initialCoords, this.enemies);

  Matrix<EnemyType> objects() {
    // TODO this
    return null;
  }
}