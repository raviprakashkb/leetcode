class Solution {
    func twoCitySchedCost(_ costs: [[Int]]) -> Int {
        var sortedCosts = costs.sorted(by: {
           ( $0[0] - $0[1] ) <= ($1[0] - $1[1])
        })
        print(sortedCosts)
        let n = costs.count / 2
        var totalCost = 0
        for i in 0 ..< n{
            totalCost += sortedCosts[i][0]
        }
         for j in (n ) ..< sortedCosts.count{
            totalCost += sortedCosts[j][1]
        }
        return totalCost
    }
}
