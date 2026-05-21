class Solution {
  int longestCommonPrefix(List<int> arr1, List<int> arr2) {
    Set<String> prefixes = {};

    for (int num in arr1) {
      String s = num.toString();

      for (int i = 1; i <= s.length; i++) {
        prefixes.add(s.substring(0, i));
      }
    }

    int maxLength = 0;

    for (int num in arr2) {
      String s = num.toString();

      for (int i = 1; i <= s.length; i++) {
        String prefix = s.substring(0, i);

        if (prefixes.contains(prefix)) {
          maxLength = i > maxLength ? i : maxLength;
        }
      }
    }

    return maxLength;
  }
}