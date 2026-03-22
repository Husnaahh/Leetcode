class Solution {
  bool findRotation(List<List<int>> mat, List<List<int>> target) {
    for (int i = 0; i < 4; i++) {
      if (_isEqual(mat, target)) return true;
      mat = _rotate(mat);
    }
    return false;
  }

  List<List<int>> _rotate(List<List<int>> mat) {
    int n = mat.length;
    List<List<int>> res =
        List.generate(n, (_) => List.filled(n, 0));

    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        res[j][n - i - 1] = mat[i][j];
      }
    }
    return res;
  }

  bool _isEqual(List<List<int>> a, List<List<int>> b) {
    int n = a.length;
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        if (a[i][j] != b[i][j]) return false;
      }
    }
    return true;
  }
}