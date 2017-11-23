/*
 * There are N gas stations along a circular route, where the amount of gas at station i is gas[i].
 *
 * You have a car with an unlimited gas tank and it costs cost[i] of gas to travel from station i to its next station (i+1). You begin the journey with an empty tank at one of the gas stations.
 *
 * Return the starting gas station's index if you can travel around the circuit once, otherwise return -1.
 *
 * Note:
 * The solution is guaranteed to be unique.
 */

class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        var start = gas.count - 1, end = 0, sum = gas[start] - cost[start]
        while start > end {
            if sum >= 0 {
                sum += gas[end] - cost[end]
                end += 1
            } else {
                start -= 1
                sum += gas[start] - cost[start]
            }
        }
        return sum >= 0 ? start : -1
    }
}

var gas = [4, 2, 3, 1, 0]
var cost = [1, 2, 3, 1, 0]

gas = [4]
cost = [5]

//gas = [5]
//cost = [4]

//gas = [1, 2]
//cost = [2, 1]

print(Solution().canCompleteCircuit(gas, cost))


