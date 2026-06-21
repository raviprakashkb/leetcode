lass Solution {

    func maxIceCream(_ costs: [Int], _ coins: Int) -> Int {
        guard !costs.isEmpty else { return 0 }
        
        // Find the actual maximum cost to avoid allocating a massive 1,000_000 element array unnecessarily
        let maxCost = costs.max() ?? 0
        
        // frequencyBuckets[i] will store how many ice cream bars cost exactly 'i' coins
        var frequencyBuckets = Array(repeating: 0, count: maxCost + 1)
        for cost in costs {
            frequencyBuckets[cost] += 1
        }
        
        var totalIceCreamsBought = 0
        var remainingCoins = coins
        
        // Iterate through all possible prices up to the maximum cost found
        for price in 1...maxCost {
            let availableBarsOfThisPrice = frequencyBuckets[price]
            
            // Skip prices that no ice cream bars have
            guard availableBarsOfThisPrice > 0 else { continue }
            
            // Calculate how many bars we can afford at this price point
            let affordableBars = min(remainingCoins / price, availableBarsOfThisPrice)
            
            // If we can't even afford one bar at this price, we can't afford anything higher either
            if affordableBars == 0 {
                break
            }
            
            totalIceCreamsBought += affordableBars
            remainingCoins -= affordableBars * price
        }
        
        return totalIceCreamsBought
    }

}