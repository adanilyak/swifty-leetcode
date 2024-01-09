//
//  DisjointSetTests.swift
//  Created by Alexander Danilyak on 09.01.2024.
//

import XCTest
@testable import DS

final class DisjointSetTests: XCTestCase {
    func testDisjointSetInit() {
        let ds = DisjointSet(n: 5)
        XCTAssertEqual(ds.componentCount, 5, "Should have 5 components")
        XCTAssertEqual(ds.componentSize, [1, 1, 1, 1, 1], "All components should be size 1")
        XCTAssertEqual(ds.parent, [0, 1, 2, 3, 4], "All components should has itself as a parent")
    }
    
    func testDisjointSetUnionFind() {
        let ds = DisjointSet(n: 5)
        ds.union(0, 1)
        ds.union(0, 2)
        
        XCTAssertEqual(ds.find(0), ds.find(1), "Should be in the same set")
        XCTAssertEqual(ds.find(1), ds.find(2), "Should be in the same set")
        XCTAssertEqual(ds.find(2), ds.find(0), "Should be in the same set")
        XCTAssertNotEqual(ds.find(0), ds.find(3), "Should be in different sets")
        XCTAssertNotEqual(ds.find(0), ds.find(4), "Should be in different sets")
    }
}
