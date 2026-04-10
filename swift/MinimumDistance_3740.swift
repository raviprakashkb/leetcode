//
// Solution to  3740. Minimum Distance Between Three Equal Elements I
// https://leetcode.com/problems/minimum-distance-between-three-equal-elements-i/
//
class Solution {
    func minimumDistance(_ nums: [Int]) -> Int {
        var minDistance = Int.max
        var indexMap  = [Int:(Int,Int)]()
        for i in 0 ..< nums.count {
            if let indexPair = indexMap[nums[i]] {
                if( indexPair.0 != -1 ){
                    minDistance = min(minDistance, 2 * (i - indexPair.0))
                }
                indexMap[nums[i]] = (indexPair.1,i)
            } else {
                indexMap[nums[i]] = (-1,i)
            }
        }
        return minDistance == Int.max ? -1 : minDistance;
    }
}
