class Solution {
  double findMedianSortedArrays(List<int> nums1, List<int> nums2) {
    if (nums1.length > nums2.length) {
      return findMedianSortedArrays(nums2, nums1);
    }

    int m = nums1.length;
    int n = nums2.length;

    int low = 0;
    int high = m;

    while (low <= high) {
      int partitionX = (low + high) ~/ 2;
      int partitionY = (m + n + 1) ~/ 2 - partitionX;

      int maxLeftX =
          (partitionX == 0) ? -1000000000 : nums1[partitionX - 1];
      int minRightX =
          (partitionX == m) ? 1000000000 : nums1[partitionX];

      int maxLeftY =
          (partitionY == 0) ? -1000000000 : nums2[partitionY - 1];
      int minRightY =
          (partitionY == n) ? 1000000000 : nums2[partitionY];

      if (maxLeftX <= minRightY && maxLeftY <= minRightX) {
        if ((m + n) % 2 == 0) {
          return ( 
            (maxLeftX > maxLeftY ? maxLeftX : maxLeftY) +
            (minRightX < minRightY ? minRightX : minRightY)
          ) / 2.0;
        } else {
          return (maxLeftX > maxLeftY ? maxLeftX : maxLeftY).toDouble();
        }
      } else if (maxLeftX > minRightY) {
        high = partitionX - 1;
      } else {
        low = partitionX + 1;
      }
    }

    return 0.0;
  }
}
