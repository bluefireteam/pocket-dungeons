import 'dart:ui';

abstract class Page {
  Size size;

  Page(this.size);

  void render(Canvas c);
  void update(double dt);

  void up() {}
  void down() {}
  void select() {}
}