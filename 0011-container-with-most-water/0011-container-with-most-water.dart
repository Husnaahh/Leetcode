class Solution {
  int maxArea(List<int> height) {
    int left = 0;
    int right = height.length - 1;
    int maxWater = 0;

    while (left < right) {
      int h = height[left] < height[right]
          ? height[left]
          : height[right];

      int width = right - left;
      int area = h * width;

      if (area > maxWater) maxWater = area;

      if (height[left] < height[right]) {
        left++;
      } else {
        right--;
      }
    }

    return maxWater;
  }
}
