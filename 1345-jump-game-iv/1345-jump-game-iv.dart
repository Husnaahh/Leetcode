import 'dart:collection';

class Solution {
  int minJumps(List<int> arr) {
    int n = arr.length;

    if (n == 1) return 0;

    Map<int, List<int>> map = {};

    for (int i = 0; i < n; i++) {
      map.putIfAbsent(arr[i], () => []);
      map[arr[i]]!.add(i);
    }

    Queue<List<int>> queue = Queue();
    queue.add([0, 0]); 

    List<bool> visited = List.filled(n, false);
    visited[0] = true;

    while (queue.isNotEmpty) {
      var current = queue.removeFirst();

      int index = current[0];
      int steps = current[1];

      if (index == n - 1) {
        return steps;
      }

      List<int> neighbors = [];

      if (index - 1 >= 0) {
        neighbors.add(index - 1);
      }
      if (index + 1 < n) {
        neighbors.add(index + 1);
      }

      neighbors.addAll(map[arr[index]]!);

      for (int next in neighbors) {
        if (!visited[next]) {
          visited[next] = true;
          queue.add([next, steps + 1]);
        }
      }

      map[arr[index]]!.clear();
    }

    return -1;
  }
}