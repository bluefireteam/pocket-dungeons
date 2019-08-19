import 'dart:math' show Random;

import '../engine/coords.dart';
import 'dungeon.dart';
import 'enemy_type.dart';

class Generator {

  static Dungeon randomMap(Random random, int level) {
    List<List<int>> matrix = [
      '000000000000000000000000000',
      '000000000222222222000000000',
      '000000000211111112000000000',
      '000000000211111112000000000',
      '000000000211111112000000000',
      '000000000211111112000000000',
      '000000000222222222000000000',
      '000000000000000000000000000',
    ].map((e) => e.split('').map((f) => int.parse(f)).toList()).toList();

    return Dungeon(matrix, Coords(12, 4), {
      Coords(10, 2): EnemyType.ZOMBIE,
    });
  }
}