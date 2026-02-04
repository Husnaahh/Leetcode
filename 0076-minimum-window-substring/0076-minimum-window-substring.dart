class Solution {
  String minWindow(String s, String t) {
    if (t.length > s.length) return "";

    Map<String, int> need = {};
    for (var ch in t.split('')) {
      need[ch] = (need[ch] ?? 0) + 1;
    }

    int required = need.length;
    int formed = 0;

    Map<String, int> window = {};

    int left = 0;
    int minLen = 1 << 30;
    int start = 0;

    for (int right = 0; right < s.length; right++) {
      String ch = s[right];
      window[ch] = (window[ch] ?? 0) + 1;

      if (need.containsKey(ch) && window[ch] == need[ch]) {
        formed++;
      }

      while (left <= right && formed == required) {
        if (right - left + 1 < minLen) {
          minLen = right - left + 1;
          start = left;
        }

        String leftChar = s[left];
        window[leftChar] = window[leftChar]! - 1;

        if (need.containsKey(leftChar) &&
            window[leftChar]! < need[leftChar]!) {
          formed--;
        }

        left++;
      }
    }

    return minLen == (1 << 30)
        ? ""
        : s.substring(start, start + minLen);
  }
}
