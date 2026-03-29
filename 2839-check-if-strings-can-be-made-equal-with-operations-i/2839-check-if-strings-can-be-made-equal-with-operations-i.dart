class Solution {
  bool canBeEqual(String s1, String s2) {
    List<String> even1 = [s1[0], s1[2]];
    List<String> even2 = [s2[0], s2[2]];

    List<String> odd1 = [s1[1], s1[3]];
    List<String> odd2 = [s2[1], s2[3]];

    even1.sort();
    even2.sort();
    odd1.sort();
    odd2.sort();

    return even1[0] == even2[0] &&
           even1[1] == even2[1] &&
           odd1[0] == odd2[0] &&
           odd1[1] == odd2[1];
  }
}