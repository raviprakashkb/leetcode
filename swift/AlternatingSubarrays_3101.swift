class Solution {
    func countAlternatingSubarrays(_ nums: [Int]) -> Int {
        var dp = Array(repeating:1, count:nums.count )
        for i in 1 ..< nums.count {
            if nums[i - 1] != nums[i] {
                dp[i] = dp[i - 1] + 1
            }
        }
        return dp.reduce(0,+)
    }
}
