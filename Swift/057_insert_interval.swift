/* Definition for an interval. */
public class Interval : CustomStringConvertible {
    public var start: Int
    public var end: Int
    public init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }

    public var description: String {
        return "[\(start), \(end)]"
    }
}

class Solution {

    func insert(_ intervals: [Interval], _ newInterval: Interval) -> [Interval] {
        if intervals.count == 0 {
            return [newInterval]
        }
        var result = [Interval]()
        var curr = newInterval

        for i in intervals {
            if i.end < curr.start {
                result.append(i)
            } else if i.start > curr.end {
                result.append(curr)
                curr = i
            } else if i.end >= curr.start || i.start <= cur.end {
                curr.start = min(curr.start, i.start)
                curr.end = max(curr.end, i.end)
            }
        }
        result.append(curr)
        return result
    }

    // slow but very cleardy
    func insertC(_ intervals: [Interval], _ newInterval: Interval) -> [Interval] {
        if intervals.count == 0 {
            return [newInterval]
        }
        var start = newInterval.start, end = newInterval.end
        var left = [Interval](), right = [Interval]()
        for i in intervals {
            if i.end < start {
                left.append(i)
            } else if i.start > end {
                right.append(i)
            } else if i.end >= start || i.start <= end {
                start = min(start, i.start)
                end = max(end, i.end)
            }
        }
        return left + [Interval(start, end)] + right
    }
}

var a = Interval(1, 3)
var b = Interval(6, 9)
print(Solution().insert([a, b], Interval(2, 5)))


a = Interval(1, 2)
b = Interval(3, 5)
var c = Interval(6, 7)
var d = Interval(8, 10)
var e = Interval(12, 16)
print(Solution().insert([a, b, c, d, e], Interval(4, 9)))

a = Interval(1, 5)
print(Solution().insert([a], Interval(0, 3)))


print(Solution().insert([a], Interval(2, 3)))


print(Solution().insert([Interval(1,5)], Interval(6, 8)))
