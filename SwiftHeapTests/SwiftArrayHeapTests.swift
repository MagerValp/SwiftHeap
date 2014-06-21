//
//  SwiftArrayHeapTests.swift
//  SwiftHeap
//
//  Created by Pelle on 2014-06-21.
//  Copyright (c) 2014 AutoMac. All rights reserved.
//

import XCTest
import SwiftHeap

class SwiftArrayHeapTests: XCTestCase {

    var heap = SwiftArrayHeap()
    var testValues = Int[]()
    var sortedValues = Int[]()
    
    override func setUp() {
        super.setUp()
        heap = SwiftArrayHeap()
        testValues = [36, 37, 15, 25, 1, 86, 64, 1, 57, 79, 88, 54, 52, 23, 98, 90, 64, 35, 55, 58]
        sortedValues = sort(testValues, { $0 < $1 } )
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPush() {
        XCTAssertEqual(self.heap.size, 0, "heap size should be 0")
        self.heap.push(12)
        XCTAssertEqual(self.heap.size, 1, "heap size should be 1")
        self.heap.push(23)
        XCTAssertEqual(self.heap.size, 2, "heap size should be 2")
        self.heap.push(34)
        XCTAssertEqual(self.heap.size, 3, "heap size should be 3")
    }
    
    func testPop() {
        self.heap.push(12)
        self.heap.push(23)
        self.heap.push(34)
        XCTAssertEqual(self.heap.size, 3, "heap size should be 3");
        self.heap.pop()
        XCTAssertEqual(self.heap.size, 2, "heap size should be 2");
        self.heap.pop()
        XCTAssertEqual(self.heap.size, 1, "heap size should be 1");
        self.heap.pop()
        XCTAssertEqual(self.heap.size, 0, "heap size should be 0");
    }
    
    func testHeapSort() {
        for value in self.testValues {
            self.heap.push(value)
        }
        var heapSortedValues = Int[]()
        while (self.heap.size > 0) {
            heapSortedValues.append(self.heap.pop())
        }
        XCTAssertEqual(heapSortedValues.count, self.sortedValues.count, "heap output should be sorted")
        for i in 0..heapSortedValues.count {
            XCTAssertEqual(heapSortedValues[i], self.sortedValues[i], "heap output should be sorted")
        }
    }
    
    func testPerformance() {
        let batchSize = 128
        let batchCount = 1
        var buffer = Int[]()
        
        srandom(0xf00dface)
        for var i = 0; i < batchSize * batchCount; i++ {
            buffer.append(random())
        }
        
        self.measureBlock() {
            for var offset: Int = 0; offset < batchSize * batchCount; offset += batchSize {
                for var i: Int = 0; i < batchSize; i++ {
                    self.heap.push(buffer[offset + i])
                }
                while self.heap.size > 0 {
                    self.heap.pop()
                }
            }
        }
    }

}
