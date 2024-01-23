//
//  HeapTests.swift
//  Created by Alexander Danilyak on 26.12.2023.
//

import XCTest
@testable import DS

// ---------------------------- Disclaimer ----------------------------
// Thats not the best way to write tests
// Each test should be independent and test only one function at a time
// This was done in order to simplify the implementation
//

final class HeapTests: XCTestCase {
    func testMinHeapInit() {
        let heap = Heap<Int>(with: <)
        XCTAssertEqual(heap.size, 0, "Should contain 0 elements")
        XCTAssertNil(heap.root, "Should be nil")
        XCTAssertTrue(heap.isEmpty, "Should be true")
    }
    
    func testMinHeapInitWithArray() {
        let heap = Heap(from: [1, 2, 3, 4, 5], with: <)
        XCTAssertEqual(heap.size, 5, "Should contain 5 elements")
        XCTAssertEqual(heap.root, 1, "Should be 1")
        XCTAssertFalse(heap.isEmpty, "Should be false")
    }
    
    func testMinHeapInitWithLargeArray() {
        let heap = Heap(from: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16], with: <)
        XCTAssertEqual(heap.size, 16, "Should contain 16 elements")
        XCTAssertEqual(heap.root, 1, "Should be 1")
        XCTAssertFalse(heap.isEmpty, "Should be false")
    }
    
    func testMaxHeapInitWithLargeArray() {
        let heap = Heap(from: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16], with: >)
        XCTAssertEqual(heap.size, 16, "Should contain 16 elements")
        XCTAssertEqual(heap.root, 16, "Should be 16")
        XCTAssertFalse(heap.isEmpty, "Should be false")
    }
    
    func testMinHeapPoll() {
        let heap = Heap(from: [1, 2, 3], with: <)
        XCTAssertEqual(heap.poll(), 1, "Should be 1")
        XCTAssertEqual(heap.poll(), 2, "Should be 2")
        XCTAssertEqual(heap.poll(), 3, "Should be 3")
        XCTAssertNil(heap.poll(), "Should be nil")
    }
    
    func testMaxHeapPoll() {
        let heap = Heap(from: [1, 2, 3], with: >)
        XCTAssertEqual(heap.poll(), 3, "Should be 3")
        XCTAssertEqual(heap.poll(), 2, "Should be 2")
        XCTAssertEqual(heap.poll(), 1, "Should be 1")
        XCTAssertNil(heap.poll(), "Should be nil")
    }
    
    func testMinHeapInsertPoll() {
        let heap = Heap(from: [1, 3, 5], with: <)
        heap.insert(4)
        heap.insert(2)
        XCTAssertEqual(heap.poll(), 1, "Should be 1")
        XCTAssertEqual(heap.poll(), 2, "Should be 2")
        XCTAssertEqual(heap.poll(), 3, "Should be 3")
        XCTAssertEqual(heap.poll(), 4, "Should be 4")
        XCTAssertEqual(heap.poll(), 5, "Should be 5")
        XCTAssertNil(heap.poll(), "Should be nil")
    }
    
    func testMaxHeapInsertPoll() {
        let heap = Heap(from: [1, 3, 4], with: >)
        heap.insert(2)
        heap.insert(5)
        XCTAssertEqual(heap.poll(), 5, "Should be 5")
        XCTAssertEqual(heap.poll(), 4, "Should be 4")
        XCTAssertEqual(heap.poll(), 3, "Should be 3")
        XCTAssertEqual(heap.poll(), 2, "Should be 2")
        XCTAssertEqual(heap.poll(), 1, "Should be 1")
        XCTAssertNil(heap.poll(), "Should be nil")
    }
    
    func testDescription() {
        let heap = Heap(from: [1, 3, 5], with: <)
        XCTAssertEqual(heap.description, "[1, 3, 5]")
    }
}
