import 'package:flame/text_config.dart';

import 'pallete.dart';

const TILE_SIZE = 16.0;
const ACTION_TIME = 0.75;

final TextConfig _base = TextConfig(fontFamily: 'BitPotion', fontSize: 24.0, color: Pallete.white.color);

class Fonts {
  static final TextConfig title = _base.withFontSize(64.0);
  static final TextConfig menuItems = _base.withFontSize(28.0);
}