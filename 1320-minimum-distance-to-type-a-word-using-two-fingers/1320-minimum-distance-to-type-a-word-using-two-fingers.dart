class Solution {
  int minimumDistance(String word) {
    int n = word.length;

    int dist(int a, int b) {
      int x1 = a ~/ 6, y1 = a % 6;
      int x2 = b ~/ 6, y2 = b % 6;
      return (x1 - x2).abs() + (y1 - y2).abs();
    }

    List<int> dp = List.filled(26, 0);

    int res = 0;

    for (int i = 0; i < n - 1; i++) {
      int cur = word.codeUnitAt(i) - 'A'.codeUnitAt(0);
      int next = word.codeUnitAt(i + 1) - 'A'.codeUnitAt(0);

      int d = dist(cur, next);

      for (int j = 0; j < 26; j++) {
        dp[cur] = dp[cur] > dp[j] + d - dist(j, next)
            ? dp[cur]
            : dp[j] + d - dist(j, next);
      }

      res += d;
    }

    int maxSave = dp.reduce((a, b) => a > b ? a : b);

    return res - maxSave;
  }
}