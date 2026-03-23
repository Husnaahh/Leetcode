class Solution {
  int maxProductPath(List<List<int>> grid) {
    int m = grid.length;
    int n = grid[0].length;
    const int MOD = 1000000007;

    // max and min product DP
    List<List<int>> maxDp =
        List.generate(m, (_) => List.filled(n, 0));
    List<List<int>> minDp =
        List.generate(m, (_) => List.filled(n, 0));

    // start
    maxDp[0][0] = grid[0][0];
    minDp[0][0] = grid[0][0];

    // first row
    for (int j = 1; j < n; j++) {
      maxDp[0][j] = maxDp[0][j - 1] * grid[0][j];
      minDp[0][j] = maxDp[0][j];
    }

    // first column
    for (int i = 1; i < m; i++) {
      maxDp[i][0] = maxDp[i - 1][0] * grid[i][0];
      minDp[i][0] = maxDp[i][0];
    }

    // fill DP
    for (int i = 1; i < m; i++) {
      for (int j = 1; j < n; j++) {
        int val = grid[i][j];

        int a = maxDp[i - 1][j] * val;
        int b = minDp[i - 1][j] * val;
        int c = maxDp[i][j - 1] * val;
        int d = minDp[i][j - 1] * val;

        int maxVal = a;
        int minVal = a;

        for (int x in [b, c, d]) {
          if (x > maxVal) maxVal = x;
          if (x < minVal) minVal = x;
        }

        maxDp[i][j] = maxVal;
        minDp[i][j] = minVal;
      }
    }

    int result = maxDp[m - 1][n - 1];

    if (result < 0) return -1;
    return result % MOD;
  }
}