class Solution {
  int minPartitions(String n) {
    int maxDigit = 0;

    for (int i = 0; i < n.length ; i++) {
        int digit = int.parse(n[i]);
        if (digit > maxDigit ) {
            maxDigit = digit;
        }
    }
    return maxDigit;
  }
}