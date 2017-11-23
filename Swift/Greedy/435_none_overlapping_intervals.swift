/*
 * Given a collection of intervals, find the minimum number of intervals you need to remove to make the rest of the intervals non-overlapping.
 *
 * Note:
 * You may assume the interval's end point is always bigger than its start point.
 * Intervals like [1,2] and [2,3] have borders "touching" but they don't overlap each other.
 * Example 1:
 * Input: [ [1,2], [2,3], [3,4], [1,3] ]
 *
 * Output: 1
 *
 * Explanation: [1,3] can be removed and the rest of intervals are non-overlapping.
 * Example 2:
 * Input: [ [1,2], [1,2], [1,2] ]
 *
 * Output: 2
 *
 * Explanation: You need to remove two [1,2] to make the rest of intervals non-overlapping.
 * Example 3:
 * Input: [ [1,2], [2,3] ]
 *
 * Output: 0
 *
 * Explanation: You don't need to remove any of the intervals since they're already non-overlapping.
 */


/**
 * Definition for an interval.
 * public class Interval {
 *   public var start: Int
 *   public var end: Int
 *   public init(_ start: Int, _ end: Int) {
 *     self.start = start
 *     self.end = end
 *   }
 * }
 */

public class Interval: CustomDebugStringConvertible {
    public var start: Int
    public var end: Int
    public init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }

    public var debugDescription: String {
        return "[\(start), \(end)]"
    }
}

class Solution {
    func eraseOverlapIntervals(_ intervals: [Interval]) -> Int {
        guard intervals.count > 0 else { return 0 }
        var intervals = intervals.sorted(by: { $0.end < $1.end })
        var end = intervals[0].end, count = 0
        for i in 1..<intervals.count {
            if intervals[i].start < end {
                end = min(intervals[i].end, end)
                count += 1
            } else {
                end = intervals[i].end
            }
        }
        return count
    }
}

let a = Interval(1, 2)
let b = Interval(2, 3)
let c = Interval(3, 4)
let d = Interval(1, 3)
print(Solution().eraseOverlapIntervals([a, b]))


