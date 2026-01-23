class Solution {
  void nextPermutation(List<int> nums) {
    int n = nums.length;
    int i = n - 2;

    while (i >= 0 && nums[i] >= nums[i + 1]) {
      i--;
    }

    if (i >= 0) {
      int j = n - 1;
      while (nums[j] <= nums[i]) {
        j--;
      }
      _swap(nums, i, j);
    }

    _reverse(nums, i + 1, n - 1);
  }

  void _swap(List<int> nums, int i, int j) {
    int temp = nums[i];
    nums[i] = nums[j];
    nums[j] = temp;
  }

  void _reverse(List<int> nums, int start, int end) {
    while (start < end) {
      _swap(nums, start, end);
      start++;
      end--;
    }
  }
}
