import 'dart:math' show Random;

import '../engine/coords.dart';
import '../engine/matrix.dart';
import 'dungeon.dart';
import 'enemy_type.dart';

class Generator {

  static Dungeon randomMap(Random random, int level) {
    Matrix<int> matrix = Matrix.from([
      '000000000000000000000000000',
      '000000000222222222000000000',
      '000000000211111112000000000',
      '000000000211111112000000000',
      '000000000211111112000000000',
      '000000000211111112000000000',
      '000000000222222222000000000',
      '000000000000000000000000000',
    ].map((e) => e.split('').map((f) => int.parse(f)).toList()).toList());

    return Dungeon(matrix, Coords(12, 4), {
      Coords(10, 2): EnemyType.ZOMBIE,
    });
  }
}