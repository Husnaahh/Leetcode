class Solution {
  bool checkStrings(String s1, String s2) {
    if (s1.length != s2.length) return false;

    List<String> even1 = [];
    List<String> even2 = [];
    List<String> odd1 = [];
    List<String> odd2 = [];

    for (int i = 0; i < s1.length; i++) {
      if (i % 2 == 0) {
        even1.add(s1[i]);
        even2.add(s2[i]);
      } else {
        odd1.add(s1[i]);
        odd2.add(s2[i]);
      }
    }

    even1.sort();
    even2.sort();
    odd1.sort();
    odd2.sort();

    for (int i = 0; i < even1.length; i++) {
      if (even1[i] != even2[i]) return false;
    }

    for (int i = 0; i < odd1.length; i++) {
      if (odd1[i] != odd2[i]) return false;
    }

    return true;
  }
}