class Solution {
  int mirrorDistance(int n) {
    int reverse(int num) {
      int rev = 0;
      while (num > 0) {
        rev = rev * 10 + (num % 10);
        num ~/= 10;
      }
      return rev;
    }

    int revN = reverse(n);
    return (n - revN).abs();
  }
}