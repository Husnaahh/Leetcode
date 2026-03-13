class Solution {
  bool canFinish(int h, List<int> workers, int time) {
    int total = 0;

    for (int w in workers) {
      int left = 0, right = h;

      while (left <= right) {
        int mid = (left + right) ~/ 2;
        int cost = w * mid * (mid + 1) ~/ 2;

        if (cost <= time) {
          left = mid + 1;
        } else {
          right = mid - 1;
        }
      }

      total += right;

      if (total >= h) return true;
    }

    return false;
  }

  int minNumberOfSeconds(int mountainHeight, List<int> workerTimes) {
    int left = 0;
    int right = 1 << 60;
    int ans = right;

    while (left <= right) {
      int mid = (left + right) ~/ 2;

      if (canFinish(mountainHeight, workerTimes, mid)) {
        ans = mid;
        right = mid - 1;
      } else {
        left = mid + 1;
      }
    }

    return ans;
  }
}