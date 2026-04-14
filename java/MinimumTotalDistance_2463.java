import java.util.*;

class Solution {
    public long minimumTotalDistance(List<Integer> robot, int[][] factory) {
        // 1. Sort both to use the greedy property: 
        // Robots in order will always map to factories in order.
        Collections.sort(robot);
        Arrays.sort(factory, Comparator.comparingInt(a -> a[0]));

        // 2. Flatten factories based on their capacity
        ArrayList<Integer> factoryPositions = new ArrayList<>();
        for (int[] fact : factory) {
            for (int i = 0; i < fact[1]; i++) {
                factoryPositions.add(fact[0]);
            }
        }

        int roboCount = robot.size();
        int factCount = factoryPositions.size();
        
        // Large value for infinity, but safe from overflow when adding distances
        long INF = 1e15; 
        
        // nextPos[j] means: min distance for robots [i+1...end] using factories [j...end]
        long[] nextPos = new long[factCount + 1];
        
        // Base case: If i == roboCount (no robots left), distance is 0.
        // nextPos is already 0 by default.

        // 3. DP Transition
        for (int i = roboCount - 1; i >= 0; i--) {
            long[] curPos = new long[factCount + 1];
            
            // Base case for current robot: if no factories left, cost is INF
            curPos[factCount] = INF;
            
            for (int j = factCount - 1; j >= 0; j--) {
                // Option A: Assign current robot i to current factory position j
                long assign = Math.abs((long)robot.get(i) - factoryPositions.get(j)) + nextPos[j+1];
                
                // Option B: Skip current factory position j for current robot i
                long skip = curPos[j+1];
                
                curPos[j] = Math.min(assign, skip);
            }
            // Move to the next robot (moving backwards from i to i-1)
            nextPos = curPos;
        }

        return nextPos[0];
    }
}