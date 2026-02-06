class Solution {
  bool isValid(String s) {
    List<String> stack = [];

    Map<String, String> pairs = {
      ')': '(',
      ']': '[',
      '}': '{',
    };

    for (int i = 0; i < s.length; i++) {
      String ch = s[i];

      if (pairs.containsValue(ch)) {
        stack.add(ch); 
      } else {
        if (stack.isEmpty || stack.removeLast() != pairs[ch]) {
          return false;
        }
      }
    }

    return stack.isEmpty;
  }
}
