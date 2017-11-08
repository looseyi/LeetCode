/* # Time:  O(m + n) */
/* # Space: O(1) */
/* # */
/* # Implement wildcard pattern matching with support for '?' and '*'. */
/* #  */
/* # '?' Matches any single character. */
/* # '*' Matches any sequence of characters (including the empty sequence). */
/* #  */
/* # The matching should cover the entire input string (not partial). */
/* #  */
/* # The function prototype should be: */
/* # bool isMatch(const char *s, const char *p) */
/* #  */
/* # Some examples: */
/* # isMatch("aa","a") -> false */
/* # isMatch("aa","aa") -> true */
/* # isMatch("aaa","aa") -> false */
/* # isMatch("aa", "*") -> true */
/* # isMatch("aa", "a*") -> true */
/* # isMatch("ab", "?*") -> true */
/* # isMatch("aab", "c*a*b") -> false */
/* # */

/* # iteration */
class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let arrS = Array(s)
        let arrP = Array(p)
        var p_ptr = 0, s_ptr = 0
        var last_s_ptr = -1, last_p_ptr = -1
        while s_ptr < arrS.count {
            if p_ptr < arrP.count && (arrS[s_ptr] == arrP[p_ptr] || arrP[p_ptr] == "?") {
                s_ptr += 1
                p_ptr += 1
            } else if p_ptr < arrP.count && arrP[p_ptr] == "*" {
                p_ptr += 1
                last_s_ptr = s_ptr
                last_p_ptr = p_ptr
            } else if last_p_ptr != -1 {
                last_s_ptr += 1
                s_ptr = last_s_ptr
                p_ptr = last_p_ptr
            } else {
                return false
            }
        }
        while p_ptr < arrP.count && arrP[p_ptr] == "*" {
            p_ptr += 1
        }
        return p_ptr == arrP.count
    }
}

print(Solution().isMatch("aaaabaaaab", "a*b*b"))
print(Solution().isMatch("aaaaaaaaaaaaab", "a*a*a*a*a*a*a*a*a*a*c"))
print(Solution().isMatch("aa", "a"))
print(Solution().isMatch("aa", "aa"))
print(Solution().isMatch("aaa", "aa"))
print(Solution().isMatch("aa", "a*"))
print(Solution().isMatch("aa", "?*"))
print(Solution().isMatch("ab", "?*"))
print(Solution().isMatch("aab", "c*a*b"))
