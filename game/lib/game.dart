import 'dart:math' as math;
import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flame/position.dart';

import 'camera.dart';
import 'components/player.dart';
import 'pages/page.dart';
import 'pages/title_page.dart';
import 'pallete.dart';
import 'utils.dart';

class MyGame extends BaseGame {

  Size rawSize, scaledSize;
  Position resizeOffset = Position.empty();
  double scale = 2.0;

  Camera cameraHandler;

  Page page;
  Player player;

  MyGame() {
    page = TitlePage(size);
  }


  @override
  void resize(Size rawSize) {
    recalculateScaleFactor(rawSize);

    super.resize(size);
    cameraHandler?.resize(size);
  }

  @override
  void render(Canvas c) {
    c.save();
    c.translate(resizeOffset.x, resizeOffset.y);
    c.scale(scale, scale);

    renderGame(c);

    c.restore();
    c.drawRect(Rect.fromLTWH(0.0, 0.0, rawSize.width, resizeOffset.y), Pallete.black.paint);
    c.drawRect(Rect.fromLTWH(0.0, resizeOffset.y + scaledSize.height, rawSize.width, resizeOffset.y), Pallete.black.paint);
    c.drawRect(Rect.fromLTWH(0.0, 0.0, resizeOffset.x, rawSize.height), Pallete.black.paint);
    c.drawRect(Rect.fromLTWH(resizeOffset.x + scaledSize.width, 0.0, resizeOffset.x, rawSize.height), BasicPalette.black.paint);
  }

  void recalculateScaleFactor(Size rawSize) {
    int blocksWidth = 40;
    int blocksHeight = 30;

    double width = blocksWidth * TILE_SIZE;
    double height = blocksHeight * TILE_SIZE;

    double scaleX = rawSize.width / width;
    double scaleY = rawSize.height / height;

    this.scale = math.min(scaleX, scaleY);

    this.rawSize = rawSize;
    this.size = Size(width, height);
    this.scaledSize = Size(scale * width, scale * height);
    this.resizeOffset = Position((rawSize.width - scaledSize.width) / 2, (rawSize.height - scaledSize.height) / 2);
  }

  void renderGame(Canvas c) {
    if (page != null) {
      if (size != null) {
        page.size = size;
        page.render(c);
      }
    } else {
      super.render(c);
    }
  }

  @override
  void update(double t) {
    if (page != null) {
      page.update(t);
    } else {
      super.update(t);
    }
  }

  void pause() {
    // TODO
  }
}
