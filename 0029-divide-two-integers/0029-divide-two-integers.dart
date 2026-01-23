class Solution {
  int divide(int dividend, int divisor) {
    const int INT_MAX = 2147483647;
    const int INT_MIN = -2147483648;

    if (dividend == INT_MIN && divisor == -1) return INT_MAX;
    if (dividend == INT_MIN && divisor == 1) return INT_MIN;

    bool negative = (dividend < 0) != (divisor < 0);

    int a = dividend.abs();
    int b = divisor.abs();
    int result = 0;

    while (a >= b) {
      int temp = b;
      int multiple = 1;

      while (a >= (temp << 1)) {
        temp <<= 1;
        multiple <<= 1;
      }

      a -= temp;
      result += multiple;
    }

    return negative ? -result : result;
  }
}
