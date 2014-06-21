//
//  SwiftArrayHeap.swift
//  SwiftHeap
//
//  Created by Pelle on 2014-06-21.
//  Copyright (c) 2014 AutoMac. All rights reserved.
//

import Cocoa

class SwiftArrayHeap: NSObject {
    
    var tree = Int[]()
    
    var size: Int {
    get {
        return tree.count
    }
    }
    
    func swap(thisIndex: Int, with thatIndex: Int) {
        let temp = tree[thisIndex]
        tree[thisIndex] = tree[thatIndex]
        tree[thatIndex] = temp
    }
    
    func push(value: Int) {
        
        func heap_parent(i: Int) -> Int {
            return (i - 1) / 2
        }
        
        var currentIndex = tree.count
        tree.append(value)
        var newIndex = heap_parent(currentIndex)
        while currentIndex > 0 && tree[currentIndex] < tree[newIndex] {
            swap(currentIndex, with: newIndex)
            currentIndex = newIndex
            newIndex = heap_parent(currentIndex)
        }
    }
    
    func pop() -> Int {
        
        func heap_left_child(i: Int) -> Int {
            return i * 2 + 1
        }
        
        func heap_right_child(i: Int) -> Int {
            return i * 2 + 2
        }
        
        let topValue = tree[0]
        let bottomValue = tree.removeLast()
        if tree.isEmpty {
            return topValue
        }
        tree[0] = bottomValue
        var currentIndex = 0
        var newIndex: Int
        var leftIndex: Int
        var rightIndex: Int
        for ;; {
            leftIndex = heap_left_child(currentIndex)
            rightIndex = heap_right_child(currentIndex)
            newIndex = currentIndex
            if leftIndex < tree.count && tree[newIndex] > tree[leftIndex] {
                newIndex = leftIndex
            }
            if rightIndex < tree.count && tree[newIndex] > tree[rightIndex] {
                newIndex = rightIndex
            }
            if newIndex == currentIndex {
                return topValue
            }
            swap(currentIndex, with: newIndex)
            currentIndex = newIndex
        }
    }

}
