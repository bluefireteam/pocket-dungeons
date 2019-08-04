import 'dart:ui';

import 'package:flame/anchor.dart';
import 'package:flame/position.dart';
import 'package:flame/text_config.dart';

import '../pallete.dart';
import '../utils.dart';
import 'page.dart';

class TitlePage extends Page {

  static const List<String> menuItems = ['play', 'config', 'quit'];
  int selectedIdx;

  TitlePage(Size size) : super(size) {
    selectedIdx = 0;
  }

  @override
  void render(Canvas c) {
    c.drawRect(Rect.fromLTWH(0.0, 0.0, size.width, size.height),
        Pallete.mainBgColor.paint);

    double y = 100.0;
    Fonts.title.render(c, 'pocket dungeons', Position(size.width / 2, y),
        anchor: Anchor.center);

    y += 100.0;

    menuItems.asMap().forEach((idx, item) {
      bool selected = idx == selectedIdx;
      TextConfig f = selected ? Fonts.menuItems.withColor(Pallete.selectionColor.color) : Fonts.menuItems;
      f.render(c, item, Position(size.width / 2, y), anchor: Anchor.center);
      y += 30.0;
    });
  }

  @override
  void up() {
    selectedIdx = (selectedIdx + menuItems.length - 1) % menuItems.length;
  }

  @override
  void down() {
    selectedIdx = (selectedIdx + 1) % menuItems.length;
  }

  @override
  void select() {
    print('todo $selectedIdx');
  }

  @override
  void update(double dt) {}
}
