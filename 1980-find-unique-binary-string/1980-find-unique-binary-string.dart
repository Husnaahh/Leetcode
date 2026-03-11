class Solution {
  String findDifferentBinaryString(List<String> nums) {
    int n = nums.length;
    String result = "";

    for (int i = 0; i < n; i++) {
        if (nums [i][i] == '0') {
            result += '1';
        } else {
            result += '0';
        }
    }
    return result;
  }
}