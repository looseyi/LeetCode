/*
 *
 * There are N children standing in a line. Each child is assigned a rating value.
 *
 * You are giving candies to these children subjected to the following requirements:
 *
 * Each child must have at least one candy.
 * Children with a higher rating get more candies than their neighbors.
 * What is the minimum candies you must give?
 */

class Solution {
    func candy(_ ratings: [Int]) -> Int {
        guard ratings.count > 0 else { return 0 }
        var i = 1, candies = Array(repeating: 1, count: ratings.count)
        while i < ratings.count {
            if ratings[i] > ratings[i - 1] {
                candies[i] = candies[i - 1] + 1
            }
            i += 1
        }
        i = ratings.count - 1
        while i > 0 {
            if ratings[i - 1] > ratings[i], candies[i - 1] <= candies[i] {
                candies[i - 1] = candies[i] + 1
            }
            i -= 1
        }
        return candies.reduce(0, +)
    }
}
var children = [10, 7, 6, 4, 3]
//children = [0]
//children = [1,2,2]
//children = [2, 2]
children = [1, 0, 2]
print(Solution().candy(children))

