class Solution {
    /*
     * first sorting numbers, use classify method with two cursor move from top and end, recurse find the match
     * the time is O(nlogn)
     */
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var a = nums.enumerated().map { ($0, $1) }.sorted { $0.1 < $1.1 }

        var i = 0
        var j = nums.count - 1
        while true {
            if i == j {
                print("should not happen")
                break
            }
            let sum = a[i].1 + a[j].1
            if sum == target {
                break
            } else if sum < target {
                i += 1
            } else {
                j -= 1
            }
        }
        return [a[i].0, a[j].0].sorted()
    }
    /*
     * naive the time is O(n ^ 2)
     */
    func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
        for i in 0..<nums.count {
            var j = i + 1
            while j < nums.count {
                if nums[i] + nums[j] == target {
                    return [i, j]
                }
                j += 1
            }
        }
        return []
    }
}

let cases = [
    [2, 7, 11, 15],
    [3, 3],
    [-1,-2,-3,-4,-5],
    [-3,4,3,90],
    [3,2,4]
]
let targes = [
    9, 6, -8, 0, 6
]
let s = Solution()
for test in zip(cases, targes) {
    print(test.0, test.1, s.twoSum(test.0, test.1))
}
