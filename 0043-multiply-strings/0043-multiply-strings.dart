class Solution {
  String multiply(String num1, String num2) {
    if (num1 == "0" || num2 == "0") return "0";

    int m = num1.length;
    int n = num2.length;
    List<int> result = List.filled(m + n, 0);

    for (int i = m - 1; i >= 0; i--) {
      int d1 = num1.codeUnitAt(i) - 48;
      for (int j = n - 1; j >= 0; j--) {
        int d2 = num2.codeUnitAt(j) - 48;

        int sum = d1 * d2 + result[i + j + 1];
        result[i + j + 1] = sum % 10;
        result[i + j] += sum ~/ 10;
      }
    }

   
    StringBuffer sb = StringBuffer();
    int i = 0;
    while (i < result.length && result[i] == 0) {
      i++;
    }
    for (; i < result.length; i++) {
      sb.write(result[i]);
    }

    return sb.toString();
  }
}