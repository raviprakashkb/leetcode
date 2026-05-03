class Solution {
    func rotateString(_ s: String, _ goal: String) -> Bool {
        guard s.count == goal.count else { return false }
        
        let sChars = Array(s)
        let goalChars = Array(goal)
        let length = sChars.count
        
        // 'offset' represents how many positions we are shifting the string
        for offset in 0..<length {
            var isMatch = true
            
            // 'i' iterates through the characters of s
            for i in 0..<length {
                if sChars[i] != goalChars[(i + offset) % length] {
                    isMatch = false
                    break
                }
            }
            
            if isMatch {
                return true
            }
        }
        return false
    }
}
