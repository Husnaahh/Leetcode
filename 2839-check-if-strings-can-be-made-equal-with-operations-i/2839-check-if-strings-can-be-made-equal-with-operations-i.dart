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

    return even1.join() == even2.join() &&
           odd1.join() == odd2.join();
  }
}