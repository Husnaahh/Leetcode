class Solution {
  bool canPartitionGrid(List<List<int>> grid) {
    int m = grid.length;
    int n = grid[0].length;

    int total = 0;

    for (var row in grid) {
      for (var val in row) {
        total += val;
      }
    }

    int rowSum = 0;
    for (int i = 0; i < m - 1; i++) {
      for (int j = 0; j < n; j++) {
        rowSum += grid[i][j];
      }

      if (rowSum * 2 == total) return true;
    }

    int colSum = 0;
    for (int j = 0; j < n - 1; j++) {
      for (int i = 0; i < m; i++) {
        colSum += grid[i][j];
      }

      if (colSum * 2 == total) return true;
    }

    return false;
  }
}