//
//  main.swift
//  Playground
//
//  Created by Edmond on 02/10/2017.
//  Copyright © 2017 SnowFund. All rights reserved.
//

import Foundation


extension Character {
    var unicodeScalarValue: UInt32 {
        return unicodeScalars[unicodeScalars.startIndex].value
    }
}


class TrieNode {
    static let R = 26

    var links: [TrieNode?] = Array(repeating: nil, count: TrieNode.R)

    var isEnd = false

    var size: UInt32 = 0

    private let stardIndexValue = Character("a").unicodeScalarValue

    public func get(_ key: Character) -> TrieNode? {
        return links[Int(key.unicodeScalarValue - stardIndexValue)]
    }

    public func put(_ key: Character, node: TrieNode) {
        links[Int(key.unicodeScalarValue - stardIndexValue)] = node
        size += 1
    }

    public func getLinks() -> Int {
        return Int(size)
    }
}


class Trie {

    private let root = TrieNode()

    public func insert(_ word: String) {
        var node = root
        for curLetter in word.characters {
            if let curNode = node.get(curLetter) {
                node = curNode
            } else {
                let newNode = TrieNode()
                node.put(curLetter, node: newNode)
                node = newNode
            }
        }
        node.isEnd = true
    }

    private func searchPrefix(_ word: String) -> TrieNode? {
        var node = root
        for curLetter in word.characters {
            if let curNode = node.get(curLetter) {
                node = curNode
            } else {
                return nil
            }
        }
        return node
    }

    public func search(_ word: String) -> Bool {
        if let node = searchPrefix(word) {
            return node.isEnd
        }
        return true
    }

    public func start(width prefixStr: String) -> Bool {
        if let _ = searchPrefix(prefixStr) {
            return true
        }
        return false

    }

    public func searchLongestPrefix(_ query: String) -> String {
        var node = root
        var perfixStr = ""
        for curLetter in query {
            if let curNode = node.get(curLetter) {
                perfixStr.append(curLetter)
                if !curNode.isEnd, curNode.getLinks() == 1 {
                    node = curNode
                } else {
                    return perfixStr
                }
            } else {
                return perfixStr
            }
        }
        return perfixStr
    }
}

extension Trie : CustomStringConvertible {
    var description: String {
        return root.description
    }
}

extension TrieNode : CustomStringConvertible {
    var description: String {
        return links.enumerated()
            .filter { $0.element != nil }
            .map { String(describing:UnicodeScalar($0.offset + Int(stardIndexValue))!) + " -> " + $0.element!.description }
            .joined(separator: "\n>>>> ")
    }
}



class Solution {

    func longestCommonPrefix(_ strs: [String]) -> String {
        guard strs.count > 0 else { return "" }
        var minLenStr = strs[0]
        strs.forEach { minLenStr = minLenStr.characters.count < $0.characters.count ? minLenStr : $0 }
        return longestCommonPrefix(minLenStr, strs: strs)
    }

    private func longestCommonPrefix(_ query: String, strs: [String]) -> String {
        if strs.count == 0 {
            return ""
        } else if strs.count == 1 {
            return strs[0]
        }
        let trie = Trie()
        strs.forEach { trie.insert($0) }
        return trie.searchLongestPrefix(query)
    }
}


print(Solution().longestCommonPrefix(["geeksforgeeks", "geeks", "geek", "geezer"]))
print(Solution().longestCommonPrefix(["apple", "ape", "april"]))
print(Solution().longestCommonPrefix(["leed", "leet", "lee"]))
print(Solution().longestCommonPrefix(["abcdefgh","aefghijk","abcefgh"]))
