class Solution {
  int numberOfStableArrays(int zero, int one, int limit) {
    const int MOD = 1000000007;

    List<List<int>> dp0 =
        List.generate(zero + 1, (_) => List.filled(one + 1, 0));
    List<List<int>> dp1 =
        List.generate(zero + 1, (_) => List.filled(one + 1, 0));

    for (int i = 1; i <= zero && i <= limit; i++) {
      dp0[i][0] = 1;
    }

    for (int j = 1; j <= one && j <= limit; j++) {
      dp1[0][j] = 1;
    }

    for (int z = 0; z <= zero; z++) {
      for (int o = 0; o <= one; o++) {
        if (z == 0 && o == 0) continue;

        for (int k = 1; k <= limit && z - k >= 0; k++) {
          dp0[z][o] = (dp0[z][o] + dp1[z - k][o]) % MOD;
        }

        for (int k = 1; k <= limit && o - k >= 0; k++) {
          dp1[z][o] = (dp1[z][o] + dp0[z][o - k]) % MOD;
        }
      }
    }

    return (dp0[zero][one] + dp1[zero][one]) % MOD;
  }
}