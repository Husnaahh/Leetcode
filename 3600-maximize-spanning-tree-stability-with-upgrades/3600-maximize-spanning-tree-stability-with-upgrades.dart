class DSU {
  late List<int> parent;
  late List<int> rank;

  DSU(int n) {
    parent = List.generate(n, (i) => i);
    rank = List.filled(n, 0);
  }

  int find(int x) {
    if (parent[x] != x) {
      parent[x] = find(parent[x]);
    }
    return parent[x];
  }

  bool union(int a, int b) {
    int pa = find(a);
    int pb = find(b);

    if (pa == pb) return false;

    if (rank[pa] < rank[pb]) {
      parent[pa] = pb;
    } else if (rank[pa] > rank[pb]) {
      parent[pb] = pa;
    } else {
      parent[pb] = pa;
      rank[pa]++;
    }

    return true;
  }
}

class Solution {
  bool can(int n, List<List<int>> edges, int k, int target) {
    DSU dsu = DSU(n);
    int used = 0;
    int upgrades = 0;

    List<List<int>> optional = [];

    for (var e in edges) {
      int u = e[0], v = e[1], s = e[2], must = e[3];

      if (must == 1) {
        if (s < target) return false;
        if (!dsu.union(u, v)) return false;
        used++;
      } else {
        optional.add(e);
      }
    }

    // try strong edges first
    optional.sort((a, b) => b[2].compareTo(a[2]));

    for (var e in optional) {
      int u = e[0], v = e[1], s = e[2];

      if (dsu.find(u) == dsu.find(v)) continue;

      if (s >= target) {
        dsu.union(u, v);
        used++;
      } else if (s * 2 >= target && upgrades < k) {
        dsu.union(u, v);
        upgrades++;
        used++;
      }

      if (used == n - 1) return true;
    }

    return used == n - 1;
  }

  int maxStability(int n, List<List<int>> edges, int k) {
    int left = 0;
    int right = 200000;
    int ans = -1;

    while (left <= right) {
      int mid = (left + right) ~/ 2;

      if (can(n, edges, k, mid)) {
        ans = mid;
        left = mid + 1;
      } else {
        right = mid - 1;
      }
    }

    return ans;
  }
}