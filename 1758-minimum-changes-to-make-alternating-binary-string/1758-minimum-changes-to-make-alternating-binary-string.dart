class Solution {
  int minOperations(String s) {
    int changesStartWith0 = 0;
    int changesStartWith1 = 0;

    for (int i = 0; i < s.length; i++) {
      String expected0 = (i % 2 == 0) ? '0' : '1';
      if (s[i] != expected0) {
        changesStartWith0++;
      }

      String expected1 = (i % 2 == 0) ? '1' : '0';
      if (s[i] != expected1) {
        changesStartWith1++;
      }
    }

    return changesStartWith0 < changesStartWith1
        ? changesStartWith0
        : changesStartWith1;
  }
}