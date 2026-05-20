class Solution {
  List<int> findThePrefixCommonArray(List<int> A, List<int> B) {
    int n = A.length;
    List<int> result = List.filled(n, 0);

    Set<int> setA = {};
    Set<int> setB = {};

    int common = 0;

    for (int i = 0; i < n; i++) {
      setA.add(A[i]);
      setB.add(B[i]);

      if (setB.contains(A[i])) {
        common++;
      }

      if (A[i] != B[i] && setA.contains(B[i])) {
        common++;
      }

      result[i] = common;
    }

    return result;
  }
}