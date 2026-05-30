class TrieNode {
  List<TrieNode?> children = List.filled(26, null);

  int bestIndex = 0;
  int bestLength = 1 << 30;
}

class Solution {
  List<int> stringIndices(
      List<String> wordsContainer, List<String> wordsQuery) {
    TrieNode root = TrieNode();

    void updateBest(TrieNode node, int idx, int len) {
      if (len < node.bestLength) {
        node.bestLength = len;
        node.bestIndex = idx;
      }
    }

    for (int i = 0; i < wordsContainer.length; i++) {
      String word = wordsContainer[i];
      int len = word.length;

      TrieNode node = root;
      updateBest(node, i, len);

      for (int j = len - 1; j >= 0; j--) {
        int c = word.codeUnitAt(j) - 97;

        node.children[c] ??= TrieNode();
        node = node.children[c]!;

        updateBest(node, i, len);
      }
    }

    List<int> ans = [];

    for (String query in wordsQuery) {
      TrieNode node = root;

      for (int j = query.length - 1; j >= 0; j--) {
        int c = query.codeUnitAt(j) - 97;

        if (node.children[c] == null) {
          break;
        }

        node = node.children[c]!;
      }

      ans.add(node.bestIndex);
    }

    return ans;
  }
}