class Solution {
  bool exist(List<List<String>> board, String word) {
    int m = board.length;
    int n = board[0].length;

    bool dfs(int r, int c, int i) {
      if (i == word.length) return true;

      if (r < 0 || c < 0 || r >= m || c >= n || board[r][c] != word[i]) {
        return false;
      }

      String temp = board[r][c];
      board[r][c] = '#'; 

      bool found =
          dfs(r + 1, c, i + 1) ||
          dfs(r - 1, c, i + 1) ||
          dfs(r, c + 1, i + 1) ||
          dfs(r, c - 1, i + 1);

      board[r][c] = temp; 
      return found;
    }

    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (dfs(i, j, 0)) return true;
      }
    }

    return false;
  }
}
