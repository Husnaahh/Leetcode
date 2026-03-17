class Solution {
  int largestSubmatrix(List<List<int>> matrix) {
    int m = matrix.length;
    int n = matrix[0].length;

    List<int> height = List.filled(n, 0);
    int maxArea = 0;

    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (matrix[i][j] == 1) {
          height[j] += 1;
        } else {
          height[j] = 0;
        }
      }

      List<int> sorted = List.from(height);
      sorted.sort((a, b) => b.compareTo(a));

      for (int k = 0; k < n; k++) {
        int area = sorted[k] * (k + 1);
        if (area > maxArea) {
          maxArea = area;
        }
      }
    }

    return maxArea;
  }
}