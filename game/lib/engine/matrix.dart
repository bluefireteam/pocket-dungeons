class Matrix<T> {
  List<List<T>> matrix;

  Matrix(int d1, int d2, T fill) {
    matrix = List.generate(d1, (_) => List.filled(d2, fill));
  }

  Matrix.square(int n, T fill) : this(n, n, fill);

  Matrix.from(this.matrix);

  void forEach(void Function(int i, int j, T el) fn) {
    for (int i = 0; i < matrix.length; i++) {
      for (int j = 0; j < matrix[i].length; j++) {
        fn(i, j, matrix[i][j]);
      }
    }
  }
}