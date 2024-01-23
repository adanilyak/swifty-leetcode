//
//  TrieTests.swift
//  Created by Alexander Danilyak on 21.01.2024.
//

import XCTest
@testable import DS

// ---------------------------- Disclaimer ----------------------------
// Thats not the best way to write tests
// Each test should be independent and test only one function at a time
// This was done in order to simplify the implementation
//

final class TrieTests: XCTestCase {
    func testInsertSerach() {
        let trie = Trie<Int>()
        trie.insert("test1", 1)
        trie.insert("test2", 2)
        trie.insert("fooo3", 3)
        trie.insert("baar4", 4)

        XCTAssertEqual(trie.traversal().count, 4)
        XCTAssertEqual(trie.search("test1"), 1)
        XCTAssertEqual(trie.search("test2"), 2)
        XCTAssertEqual(trie.search("fooo3"), 3)
        XCTAssertEqual(trie.search("baar4"), 4)
    }
    
    func testInsertDelete() {
        let trie = Trie<Int>()
        trie.insert("test1", 1)
        trie.insert("test2", 2)
        trie.insert("fooo3", 3)
        trie.insert("baar4", 4)
        
        trie.delete("test2")
        XCTAssertEqual(trie.traversal().count, 3)
        XCTAssertEqual(trie.search("test1"), 1)
        XCTAssertNil(trie.search("test2"))
        
        trie.delete("baar4")
        XCTAssertEqual(trie.traversal().count, 2)
        XCTAssertEqual(trie.search("fooo3"), 3)
        XCTAssertNil(trie.search("baar4"))
    }
}
