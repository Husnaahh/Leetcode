class Solution {
  List<List<int>> combinationSum(List<int> candidates, int target) {
    List<List<int>> result = [];
    List<int> current = [];

    _backtrack(candidates, target, 0, current, result);
    return result;
  }

  void _backtrack(
    List<int> candidates,
    int target,
    int start,
    List<int> current,
    List<List<int>> result,
  ) {
    if (target == 0) {
      result.add(List.from(current));
      return;
    }

    if (target < 0) return;

    for (int i = start; i < candidates.length; i++) {
      current.add(candidates[i]);
      _backtrack(candidates, target - candidates[i], i, current, result);
      current.removeLast(); 
    }
  }
}