class Fancy {
  static const int MOD = 1000000007;

  List<int> arr = [];
  int mul = 1;
  int add = 0;

  int modPow(int a, int b) {
    int res = 1;
    a %= MOD;

    while (b > 0) {
      if (b % 2 == 1) res = (res * a) % MOD;
      a = (a * a) % MOD;
      b ~/= 2;
    }

    return res;
  }

  int modInverse(int x) {
    return modPow(x, MOD - 2);
  }

  void append(int val) {
    int normalized = ((val - add) % MOD + MOD) % MOD;
    normalized = (normalized * modInverse(mul)) % MOD;
    arr.add(normalized);
  }

  void addAll(int inc) {
    add = (add + inc) % MOD;
  }

  void multAll(int m) {
    mul = (mul * m) % MOD;
    add = (add * m) % MOD;
  }

  int getIndex(int idx) {
    if (idx >= arr.length) return -1;
    return (arr[idx] * mul + add) % MOD;
  }
}