//
//  Trie.swift
//  Created by Alexander Danilyak on 21.01.2024.
//

import Foundation

public final class Trie<T> {
    public final class Node<U> {
        public fileprivate(set) var isTerminal: Bool = false
        public fileprivate(set) var children: [Character: Node<U>] = [:]
        public fileprivate(set) var data: T?
    }
    
    public private(set) var root: Node<T> = .init()
    
    public init() { }
    
    // MARK: - Search
    
    public func search(_ key: String) -> T? {
        var current = root
        for char in key {
            if let next = current.children[char] {
                current = next
            } else {
                return nil
            }
        }
        return current.isTerminal ? current.data : nil
    }
    
    // MARK: - Insert
    
    public func insert(_ key: String, _ value: T) {
        var current: Node? = root
        for char in key {
            if current?.children[char] == nil {
                current?.children[char] = Node()
            }
            current = current?.children[char]
        }
        current?.isTerminal = true
        current?.data = value
    }
    
    // MARK: - Delete
    
    public func delete(_ key: String) {
        var previous: Node<T>?, current = root
        for char in key {
            if let next = current.children[char] {
                previous = current
                current = next
            }
        }
        
        if previous?.children.count == 1 {
            previous?.children = [:]
        } else {
            current.isTerminal = false
            current.data = nil
        }
    }
}

// MARK: - Debug
extension Trie: CustomStringConvertible {
    func traversal() -> [String: T] {
        func dfs(_ node: Node<T>?, _ current: inout Substring, _ result: inout [String: T]) {
            guard let node else { return }
            if node.isTerminal, let value = node.data {
                result[String(current)] = value
            }
            
            for (char, nextNode) in node.children {
                current.append(char)
                dfs(nextNode, &current, &result)
                current = current.dropLast()
            }
        }
        
        var current = Substring("")
        var result = [String: T]()
        dfs(root, &current, &result)
        
        return result
    }
    
    public var description: String {
        return traversal().description
    }
}
