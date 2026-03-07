class Solution {
  int minFlips(String s) {
    int n = s.length;
    String s2 = s + s;

    int diff1 = 0;
    int diff2 = 0;
    int ans = n;

    for (int i = 0; i < s2.length; i++) {
      String expected1 = (i % 2 == 0) ? '0' : '1';
      String expected2 = (i % 2 == 0) ? '1' : '0';

      if (s2[i] != expected1) diff1++;
      if (s2[i] != expected2) diff2++;

      if (i >= n) {
        String prev1 = ((i - n) % 2 == 0) ? '0' : '1';
        String prev2 = ((i - n) % 2 == 0) ? '1' : '0';

        if (s2[i - n] != prev1) diff1--;
        if (s2[i - n] != prev2) diff2--;
      }

      if (i >= n - 1) {
        ans = ans < diff1 ? ans : diff1;
        ans = ans < diff2 ? ans : diff2;
      }
    }

    return ans;
  }
}