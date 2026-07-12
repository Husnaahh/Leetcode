class Solution {
  List<int> arrayRankTransform(List<int> arr) {
    List<int> sorted = arr.toSet().toList();
    sorted.sort();

    Map<int, int> rank = {};
    for (int i = 0; i < sorted.length; i++) {
      rank[sorted[i]] = i + 1;
    }

    return arr.map((num) => rank[num]!).toList();
  }
}