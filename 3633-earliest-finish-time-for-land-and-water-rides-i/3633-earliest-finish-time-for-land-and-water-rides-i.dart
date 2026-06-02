class Solution {
  int earliestFinishTime(
      List<int> landStartTime,
      List<int> landDuration,
      List<int> waterStartTime,
      List<int> waterDuration) {
    
    int ans = 1 << 30;

    for (int i = 0; i < landStartTime.length; i++) {
      for (int j = 0; j < waterStartTime.length; j++) {
        
        int finishLand = landStartTime[i] + landDuration[i];
        int finish1 =
            (finishLand > waterStartTime[j] ? finishLand : waterStartTime[j])
            + waterDuration[j];

        int finishWater = waterStartTime[j] + waterDuration[j];
        int finish2 =
            (finishWater > landStartTime[i] ? finishWater : landStartTime[i])
            + landDuration[i];

        ans = ans < finish1 ? ans : finish1;
        ans = ans < finish2 ? ans : finish2;
      }
    }

    return ans;
  }
}