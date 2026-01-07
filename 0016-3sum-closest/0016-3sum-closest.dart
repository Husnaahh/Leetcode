class Solution {
  int threeSumClosest(List<int> nums, int target) {
    nums.sort();

    int closestSum = nums[0] + nums[1] + nums[2];

    for (int i = 0; i < nums.length - 2; i++) {
      int left = i + 1;
      int right = nums.length - 1;

      while (left < right) {
        int currentSum = nums[i] + nums[left] + nums[right];

        if ((currentSum - target).abs() <
            (closestSum - target).abs()) {
          closestSum = currentSum;
        }

        if (currentSum < target) {
          left++;
        } else if (currentSum > target) {
          right--;
        } else {
          return currentSum;
        }
      }
    }

    return closestSum;
  }
}
