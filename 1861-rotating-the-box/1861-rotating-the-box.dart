class Solution {
  List<List<String>> rotateTheBox(List<List<String>> box) {
    int m = box.length;
    int n = box[0].length;

    for (int i = 0; i < m; i++) {
      int empty = n - 1;

      for (int j = n - 1; j >= 0; j--) {
        if (box[i][j] == '*') {
          empty = j - 1; 
        } else if (box[i][j] == '#') {
          box[i][j] = '.';
          box[i][empty] = '#';
          empty--;
        }
      }
    }

    List<List<String>> result =
        List.generate(n, (_) => List.filled(m, ''));

    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        result[j][m - 1 - i] = box[i][j];
      }
    }

    return result;
  }
}