class Solution {
 
    int removeElement(List<int> nums, int val) {
  int k = 0; 
  for (int i = 0; i < nums.length; i++) {
    if (nums[i] != val) {
      nums[k] = nums[i];
      k++;
    }
  }

  return k; 
}

void main() {
  List<int> nums = [3, 2, 2, 3];
  int val = 3;

  int newLength = removeElement(nums, val);
  print("New length: $newLength"); 
  print("Modified array: ${nums.sublist(0, newLength)}"); 
}

  
}