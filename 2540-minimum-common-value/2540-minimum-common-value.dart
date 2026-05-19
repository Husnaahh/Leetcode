class Solution {
  int getCommon(List<int> nums1, List<int> nums2) {
    int i = 0;
    int j = 0;

    while (i < nums1.length && j < nums2.length) {
      if (nums1[i] == nums2[j]) {
        return nums1[i];
      } else if (nums1[i] < nums2[j]) {
        i++;
      } else {
        j++;
      }
    }

    return -1;
  }
}