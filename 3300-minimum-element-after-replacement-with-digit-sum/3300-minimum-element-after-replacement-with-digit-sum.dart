class Solution {
  int minElement(List<int> nums) {
    int minValue = 1 << 30;

    for (int num in nums) {
      int sum = 0;
      int temp = num;

      while (temp > 0) {
        sum += temp % 10;
        temp ~/= 10;
      }

      if (sum < minValue) {
        minValue = sum;
      }
    }

    return minValue;
  }
}