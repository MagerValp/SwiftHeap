//
//  ObjCMutableArrayHeap.h
//  SwiftHeap
//
//  Created by Pelle on 2014-06-21.
//  Copyright (c) 2014 AutoMac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ObjCMutableArrayHeap : NSObject

@property NSMutableArray *tree;

- (int)size;
- (void)push:(NSNumber *)value;
- (NSNumber *)pop;

@end
