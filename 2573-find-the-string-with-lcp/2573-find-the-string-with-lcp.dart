class Solution {
  String findTheString(List<List<int>> lcp) {
    int n = lcp.length;

    for (int i = 0; i < n; i++) {
      if (lcp[i][i] != n - i) return "";
    }

    List<int> group = List.filled(n, -1);
    int g = 0;

    for (int i = 0; i < n; i++) {
      if (group[i] != -1) continue;

      group[i] = g;

      for (int j = i + 1; j < n; j++) {
        if (lcp[i][j] > 0) {
          group[j] = g;
        }
      }
      g++;
    }

    if (g > 26) return "";

    List<int> chars = List.filled(n, 0);
    for (int i = 0; i < n; i++) {
      chars[i] = 'a'.codeUnitAt(0) + group[i];
    }

    String word = String.fromCharCodes(chars);

    List<List<int>> dp = List.generate(
        n, (_) => List.filled(n, 0));

    for (int i = n - 1; i >= 0; i--) {
      for (int j = n - 1; j >= 0; j--) {
        if (word[i] == word[j]) {
          if (i + 1 < n && j + 1 < n) {
            dp[i][j] = 1 + dp[i + 1][j + 1];
          } else {
            dp[i][j] = 1;
          }
        }
      }
    }

    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        if (dp[i][j] != lcp[i][j]) {
          return "";
        }
      }
    }

    return word;
  }
}