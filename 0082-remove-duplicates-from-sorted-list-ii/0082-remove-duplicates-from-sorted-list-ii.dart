class Solution {
  ListNode? deleteDuplicates(ListNode? head) {
    ListNode dummy = ListNode(0);
    dummy.next = head;

    ListNode prev = dummy;

    while (head != null) {
      if (head.next != null && head.val == head.next!.val) {
        int duplicateVal = head.val;

        while (head != null && head.val == duplicateVal) {
          head = head.next;
        }
        prev.next = head;
      } else {
        prev = prev.next!;
        head = head.next;
      }
    }

    return dummy.next;
  }
}