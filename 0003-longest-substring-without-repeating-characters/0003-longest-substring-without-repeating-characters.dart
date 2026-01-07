class Solution {
  int lengthOfLongestSubstring(String s) {
    Map<String, int> charIndex = {};
    int left = 0;
    int maxLength = 0;

    for (int right = 0; right < s.length; right++) {
      String currentChar = s[right];

      if (charIndex.containsKey(currentChar)) {
        left = left > charIndex[currentChar]! + 1
            ? left
            : charIndex[currentChar]! + 1;
      }

      charIndex[currentChar] = right;
      maxLength = maxLength > (right - left + 1)
          ? maxLength
          : (right - left + 1);
    }

    return maxLength;
  }
}
