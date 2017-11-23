/*
 * Say you have an array for which the ith element is the price of a given stock on day i.
 *
 * Design an algorithm to find the maximum profit. You may complete as many transactions as you like (ie, buy one and sell one share of the stock multiple times). However, you may not engage in multiple transactions at the same time (ie, you must sell the stock before you buy again).
 *
 */


class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count != 0 else { return 0 }

        var total = 0, i = 0
        while i < prices.count - 1 {
            if prices[i + 1] > prices[i] {
                total += prices[i + 1] - prices[i]
            }
            i += 1
        }
        return total
    }
}

var a = [1, 5, 10, 2, 4, 2]
print(Solution().maxProfit(a)
