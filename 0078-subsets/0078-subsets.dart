class Solution {
  List<List<int>> subsets(List<int> nums) {
    List<List<int>> result = [];

    void backtrack(int index, List<int> current) {
      result.add(List.from(current));

      for (int i = index; i < nums.length; i++) {
        current.add(nums[i]);           // 
        backtrack(i + 1, current);      // 
        current.removeLast();           // 
      }
    }

    backtrack(0, []);
    return result;
  }
}