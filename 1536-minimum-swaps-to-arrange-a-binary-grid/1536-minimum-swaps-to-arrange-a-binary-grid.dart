class Solution {
  int minSwaps(List<List<int>> grid) {
    int n = grid.length;
    List<int> trailing = [];

    for (int i = 0; i < n; i++) {
      int count = 0;
      for (int j = n - 1; j >= 0; j--) {
        if (grid[i][j] == 0) {
          count++;
        } else {
          break;
        }
      }
      trailing.add(count);
    }

    int swaps = 0;

    for (int i = 0; i < n; i++) {
      int needed = n - i - 1;
      int j = i;

      while (j < n && trailing[j] < needed) {
        j++;
      }

      if (j == n) return -1;

      while (j > i) {
        int temp = trailing[j];
        trailing[j] = trailing[j - 1];
        trailing[j - 1] = temp;
        swaps++;
        j--;
      }
    }

    return swaps;
  }
}