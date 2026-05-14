class Solution {
  bool isGood(List<int> nums) {
    nums.sort();

    int n = nums.last;
    if (nums.length != n + 1) 

    return false;

     for (int i = 0; i < n - 1; i++) {
    if (nums[i] != i + 1) 
    
    return false;
  }

  if (nums[n - 1] != n || nums[n] != n) 
  
  return false;

  return true;
}
  }
