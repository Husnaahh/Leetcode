class Solution {
  int numberOfSpecialChars(String word) {
    Set<String> lower = {};
    Set<String> upper = {};
    
    for (int i = 0; i < word.length; i++) {
      String ch = word[i];
      
      if (ch == ch.toLowerCase()) {
        lower.add(ch);
      } else {
        upper.add(ch.toLowerCase());
      }
    }

    int count = 0;

    for (String ch in lower) {
      if (upper.contains(ch)) {
        count++;
      }
    }

    return count;
  }
}