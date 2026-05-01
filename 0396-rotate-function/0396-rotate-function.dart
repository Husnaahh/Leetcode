class Solution {
  int maxRotateFunction(List<int> nums) {
    int n = nums.length;

    int sum = 0;
    for (int num in nums) {
      sum += num;
    }

    int f = 0;
    for (int i = 0; i < n; i++) {
      f += i * nums[i];
    }

    int maxVal = f;

    for (int k = 1; k < n; k++) {
      f = f + sum - n * nums[n - k];
      if (f > maxVal) {
        maxVal = f;
      }
    }

    return maxVal;
  }
}