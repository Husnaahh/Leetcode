class Solution {
  int minimumDistance(List<int> nums) {
    Map<int, List<int>> map = {};

    for (int i = 0; i < nums.length; i++) {
      map.putIfAbsent(nums[i], () => []);
      map[nums[i]]!.add(i);
    }

    int ans = 1 << 30; 

    for (var list in map.values) {
      if (list.length < 3) continue;

      for (int i = 0; i + 2 < list.length; i++) {
        int dist = 2 * (list[i + 2] - list[i]);
        if (dist < ans) ans = dist;
      }
    }

    return ans == (1 << 30) ? -1 : ans;
  }
}