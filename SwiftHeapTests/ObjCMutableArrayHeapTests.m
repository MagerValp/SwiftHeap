//
//  ObjCMutableArrayHeapTests.m
//  SwiftHeap
//
//  Created by Pelle on 2014-06-21.
//  Copyright (c) 2014 AutoMac. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ObjCMutableArrayHeap.h"


@interface ObjCMutableArrayHeapTests : XCTestCase

@property ObjCMutableArrayHeap *heap;
@property NSArray *testNumbers;
@property NSArray *sortedNumbers;

@end

@implementation ObjCMutableArrayHeapTests

- (void)setUp
{
    [super setUp];
    self.heap = [[ObjCMutableArrayHeap alloc] init];
    self.testNumbers = @[@36, @37, @15, @25, @1, @86, @64, @1, @57, @79, @88, @54, @52, @23, @98, @90, @64, @35, @55, @58];
    self.sortedNumbers = [self.testNumbers sortedArrayUsingSelector:@selector(compare:)];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testPush
{
    XCTAssertEqual(self.heap.size, 0, @"heap size should be 0");
    [self.heap push:@12];
    XCTAssertEqual(self.heap.size, 1, @"heap size should be 1");
    [self.heap push:@23];
    XCTAssertEqual(self.heap.size, 2, @"heap size should be 2");
    [self.heap push:@34];
    XCTAssertEqual(self.heap.size, 3, @"heap size should be 3");
}

- (void)testPop
{
    [self.heap push:@12];
    [self.heap push:@23];
    [self.heap push:@34];
    XCTAssertEqual(self.heap.size, 3, @"heap size should be 3");
    [self.heap pop];
    XCTAssertEqual(self.heap.size, 2, @"heap size should be 2");
    [self.heap pop];
    XCTAssertEqual(self.heap.size, 1, @"heap size should be 1");
    [self.heap pop];
    XCTAssertEqual(self.heap.size, 0, @"heap size should be 0");
}

- (void)testHeapSort
{
    for (NSNumber *num in self.testNumbers) {
        [self.heap push:num];
    }
    NSMutableArray *heapSortedNumbers = [[NSMutableArray alloc] init];
    while (self.heap.size) {
        [heapSortedNumbers addObject:[self.heap pop]];
    }
    XCTAssertTrue([self.sortedNumbers isEqualToArray:heapSortedNumbers], @"heap output should be sorted");
}

- (void)testPerformance {
    const int batchSize = 128;
    const int batchCount = 10;      // 1000;
    static int buffer[batchSize * batchCount];
    
    srandom(0xf00dface);
    for (int i = 0; i < batchSize * batchCount; i++) {
        buffer[i] = (int)random();
    }
    
    ObjCMutableArrayHeap *heap = [[ObjCMutableArrayHeap alloc] init];
    [self measureBlock:^{
        for (int offset = 0; offset < sizeof(buffer) / sizeof(buffer[0]); offset += batchSize) {
            for (int i = 0; i < batchSize; i++) {
                [heap push:[NSNumber numberWithInt:buffer[offset + i]]];
            }
            while (heap.size) {
                [heap pop];
            }
        }
    }];
}

@end
