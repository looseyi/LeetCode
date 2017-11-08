class Solution {
    func isCommonPrefix(_ sts: [String], _ len: Int) -> Bool {
        let perfixStr = strs[0].subString(width: len)
        let result = strs.filter { !$0.hasPrefix(perfixStr) }.first
        return result.first != nil ? false : true
    }

    func longestCommonPrefix(_ strs: [String]) -> String {

        guard strs.count > 0 else { return "" }
        var minLen = Int.max
        strs.forEach { minLen = min(minLen, $0.characters.count) }

        var low = 1, high = minLen
        while low <= high {
            let middle = (low + high) / 2
            if isCommonPrefix(strs, middle) {
                low = middle + 1
            } else {
                high = middle - 1
            }
        }
        let str = strs[0]
        let len = (low + high) / 2
        let result = str.subString(width: len)
        return result
    }

    func longestCommonPrefixByDivsConques(_ strs: [String]) -> String {
        guard strs.count > 0 else { return "" }
        return longestCommonPrefixRange(strs, l: 0, r: strs.count)
    }

    fileprivate func longestCommonPrefixRange(_ strs: [String], l: Int, r: Int) -> String {
        if l == r {
            return strs[l]
        } else {
            let mix = (l + r) / 2
            let leftPrefix = longestCommonPrefixRange(strs, l: 0, r: mix)
            let rightPrefix = longestCommonPrefixRange(strs, l: mix + 1, r: r)
            return commonPrefix(leftPrefix, rightPrefix)
        }
    }

    fileprivate func commonPrefix(_ lhs: String, _ rhs: String) -> String {
        var min = min(lsh.characters.count, rhs.characters.count), i = 0
        while i < min {
            if lsh.characters[i] != rsh.characters[i] {
                return lsh.subString(with: i)
            }
            i += 1
        }
        return lsh.subString(with: min)
    }
}

extension String {

    func subString(with endIndex: Int) -> String {
        return String(self[self.startIndex..<self.index(self.startIndex, offsetBy: endIndex)])
    }
}


/* print(Solution().longestCommonPrefix(["a", "bbb", "ab", "abc"])) */
print(Solution().longestCommonPrefix(["a", "bbb", "ab", "abc"]))
