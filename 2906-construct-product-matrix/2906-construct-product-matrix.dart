class Solution {
  List<List<int>> constructProductMatrix(List<List<int>> grid) {
    int n = grid.length;
    int m = grid[0].length;
    const int MOD = 12345;

    int size = n * m;

    List<int> arr = [];
    for (var row in grid) {
      arr.addAll(row);
    }

    List<int> prefix = List.filled(size, 1);
    List<int> suffix = List.filled(size, 1);

    for (int i = 1; i < size; i++) {
      prefix[i] = (prefix[i - 1] * arr[i - 1]) % MOD;
    }

    for (int i = size - 2; i >= 0; i--) {
      suffix[i] = (suffix[i + 1] * arr[i + 1]) % MOD;
    }

    List<int> res = List.filled(size, 0);
    for (int i = 0; i < size; i++) {
      res[i] = (prefix[i] * suffix[i]) % MOD;
    }

    List<List<int>> ans =
        List.generate(n, (_) => List.filled(m, 0));

    int idx = 0;
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < m; j++) {
        ans[i][j] = res[idx++];
      }
    }

    return ans;
  }
}