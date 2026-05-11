class Solution {
  List<int> separateDigits(List<int> nums) {
    List<int> result = [];

    for (int num in nums) {
      String s = num.toString();
      for (int i = 0; i < s.length; i++) {
        result.add(int.parse(s[i]));
      }
    }

    return result;
  }
}