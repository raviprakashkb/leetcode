class Solution {
    func rotatedDigits(_ n: Int) -> Int {
        let s = Array(String(n)).map { Int(String($0))! }
        var memo = [String: Int]()
        
        func dp(_ index: Int, _ isLess: Bool, _ isStarted: Bool, _ hasDiff: Bool) -> Int {
            // Base case: we've processed all digits
            if index == s.count {
                return hasDiff ? 1 : 0
            }
            
            // Memoization lookup
            let state = "\(index)-\(isLess)-\(isStarted)-\(hasDiff)"
            if let cached = memo[state] { return cached }
            
            var count = 0
            let limit = isLess ? 9 : s[index]
            
            for digit in 0...limit {
                let nextIsLess = isLess || (digit < limit)
                let nextIsStarted = isStarted || (digit > 0)
                
                // Skip invalid digits: 3, 4, 7
                if [3, 4, 7].contains(digit) { continue }
                
                // Check if this digit forces the number to be different after rotation
                let nextHasDiff = hasDiff || [2, 5, 6, 9].contains(digit)
                
                count += dp(index + 1, nextIsLess, nextIsStarted, nextHasDiff)
            }
            
            memo[state] = count
            return count
        }
        
        return dp(0, false, false, false)
    }
}