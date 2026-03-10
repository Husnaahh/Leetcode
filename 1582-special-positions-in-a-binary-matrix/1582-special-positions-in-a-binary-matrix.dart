class Solution {
  int numSpecial(List<List<int>> mat) {
    int m = mat.length;
    int n = mat[0].length;

    List<int> rowCount = List.filled(m, 0);
    List<int> colCount = List.filled(n, 0);

    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (mat[i][j] == 1) {
          rowCount[i]++;
          colCount[j]++;
        }
      }
    }

    int result = 0;

    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (mat[i][j] == 1 && rowCount[i] == 1 && colCount[j] == 1) {
          result++;
        }
      }
    }

    return result;
  }
}