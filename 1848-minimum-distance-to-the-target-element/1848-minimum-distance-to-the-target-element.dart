class Solution {
  int getMinDistance(List<int> nums, int target, int start) {
    int ans = 1 << 30;

    for (int i = 0; i < nums.length; i++) {
      if (nums[i] == target) {
        int dist = (i - start).abs();
        if (dist < ans) ans = dist;
      }
    }

    return ans;
  }
}