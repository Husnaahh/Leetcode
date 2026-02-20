class Solution {
  String makeLargestSpecial(String s) {
    List<String> parts = [];
    int count = 0;
    int start = 0;

    for (int i = 0; i < s.length; i++) {
      if (s[i] == '1') count++;
      else count--;

      if (count == 0) {
        String inner = makeLargestSpecial(
            s.substring(start + 1, i));
        
        parts.add("1" + inner + "0");
        start = i + 1;
      }
    }

    parts.sort((a, b) => b.compareTo(a));

    return parts.join();
  }
}