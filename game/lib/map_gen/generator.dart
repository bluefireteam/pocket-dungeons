import 'dungeon.dart';

class Generator {

  static Dungeon randomMap(int level) {
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

    return Dungeon(matrix, [12, 4]);
  }
}