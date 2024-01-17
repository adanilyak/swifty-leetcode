//
//  DisjointSet.swift
//  Created by Alexander Danilyak on 09.01.2024.
//

import Foundation

/// https://en.wikipedia.org/wiki/Disjoint-set_data_structure
final public class DisjointSet: CustomStringConvertible {
    public private(set) var parent: [Int]
    public private(set) var componentSize: [Int]
    public private(set) var componentCount: Int
    
    // MARK: - Init
    
    public init(n: Int) {
        self.parent = Array(0..<n)
        self.componentSize = Array(repeating: 1, count: n)
        self.componentCount = n
    }
    
    // MARK: - Public Methods
    
    /// The operation `union(x, y)` replaces the set containing `x` and the set containing `y` with their union.
    /// - Parameters:
    ///   - x: the first node
    ///   - y: the second node
    /// - Returns: `true` if successfully merged, `false` if `x`and `y` are already in the same set
    /// - Complexity: On average `O(log(n))` per call
    @discardableResult public func union(_ x: Int, _ y: Int) -> Bool {
        let xi = find(x)
        let yi = find(y)
        guard xi != yi else { return false }
        
        if componentSize[xi] > componentSize[yi] {
            componentSize[xi] += componentSize[yi]
            parent[yi] = xi
        } else {
            componentSize[yi] += componentSize[xi]
            parent[xi] = yi
        }
        
        componentCount -= 1
        return true
    }
    
    /// The `find(x)` operation follows the chain of parent pointers from a specified query node `x` 
    /// until it reaches a `root` element. This `root` element represents the set to which `x` belongs and may be `x` itself
    /// - Parameter x: query node
    /// - Returns: The `root` element it reaches.
    /// - Complexity: `O(log(n))`
    public func find(_ x: Int) -> Int {
        if x == parent[x] {
            return x
        } else {
            parent[x] = find(parent[x])
            return parent[x]
        }
    }
    
    public var description: String {
        "\(parent)"
    }
}
