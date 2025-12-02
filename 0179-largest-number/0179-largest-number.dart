class Solution {
  String largestNumber(List<int> nums) {
    List<String> strNums = nums.map((n) => n.toString()).toList();

    strNums.sort((a, b) => (b + a).compareTo(a + b));

    if (strNums[0] == "0") return "0";

    return strNums.join();
  }
}
