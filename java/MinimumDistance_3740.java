class Solution {
    public int minimumDistance(int[] nums) {
        // Map stores the last two seen indices: [i-2 index, i-1 index]
        Map<Integer, int[]> lastIndices = new HashMap<>();
        int minDistance = Integer.MAX_VALUE;

        for (int i = 0; i < nums.length; i++) {
            int val = nums[i];
            if (!lastIndices.containsKey(val)) {
                lastIndices.put(val, new int[]{-1, i});
            } else {
                int[] prev = lastIndices.get(val);
                
                // If prev[0] is not -1, it means we've seen this number twice before
                // This current index 'i' is the 3rd (or 4th, 5th...) occurrence
                if (prev[0] != -1) {
                    int dist = 2 * (i - prev[0]);
                    minDistance = Math.min(minDistance, dist);
                }
                
                // Shift indices: the old "second-to-last" is replaced by "last"
                // The current index becomes the new "last"
                prev[0] = prev[1];
                prev[1] = i;
            }
        }

        return minDistance == Integer.MAX_VALUE ? -1 : minDistance;
    }
}