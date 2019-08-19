class Coords {
  final int x, y;
  const Coords(this.x, this.y);

  Coords add(Coords other) {
    return Coords(x + other.x, y + other.y);
  }
}