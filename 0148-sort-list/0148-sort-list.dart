class Solution {
  ListNode? sortList(ListNode? head) {
    if (head == null || head.next == null) return head;

    ListNode? mid = _getMiddle(head);
    ListNode? rightHead = mid!.next;
    mid.next = null;

    ListNode? left = sortList(head);
    ListNode? right = sortList(rightHead);

    return _merge(left, right);
  }

  ListNode? _getMiddle(ListNode head) {
    ListNode? slow = head;
    ListNode? fast = head.next;

    while (fast != null && fast.next != null) {
      slow = slow!.next;
      fast = fast.next!.next;
    }
    return slow;
  }

  ListNode? _merge(ListNode? l1, ListNode? l2) {
    ListNode dummy = ListNode(0);
    ListNode current = dummy;

    while (l1 != null && l2 != null) {
      if (l1.val <= l2.val) {
        current.next = l1;
        l1 = l1.next;
      } else {
        current.next = l2;
        l2 = l2.next;
      }
      current = current.next!;
    }

    current.next = l1 ?? l2;
    return dummy.next;
  }
}
