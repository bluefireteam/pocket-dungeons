import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/position.dart';
import 'package:flame/sprite.dart';

import '../utils.dart';

class Tilemap extends Component {

  static Sprite gen(int i, int j) => Sprite('tileset.png', x: TILE_SIZE * i, y: TILE_SIZE * j, width: TILE_SIZE, height: TILE_SIZE);

  static final Map<int, Sprite> blockSprites = {
    1: gen(1, 0),
    2: gen(2, 0),
  };

  List<List<int>> matrix;

  Tilemap(this.matrix);

  @override
  void render(Canvas c) {
    for (int i = 0; i < matrix.length; i++) {
      for (int j = 0; j < matrix[i].length; j++) {
        int block = matrix[i][j];
        if (block != 0) {
          blockSprites[block].renderPosition(c, Position(TILE_SIZE * j, TILE_SIZE * i));
        }
      }
    }
  }

  @override
  int priority() => 0;

  @override
  void update(double t) {
  }
}