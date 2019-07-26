//
//  NSMutableArray+category.h
//  MiYun360
//
//  Created by xiaoshunliang on 16/5/20.
//  Copyright © 2016年 AUNotBad. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (category)
/**
 *  Get the object at a given index in safe mode (nil if self is empty)
 *
 *  @param index The index
 *
 *  @return Return the object at a given index in safe mode (nil if self is empty)
 */
- (id)safeObjectAtIndex:(NSUInteger)index;
/**
 *  Sort an array by a given key with option for ascending or descending
 *
 *  @param key       The key to order the array
 *  @param array     The array to be ordered
 *  @param ascending A BOOL to choose if ascending or descending
 *
 *  @return Return the given array ordered by the given key ascending or descending
 */
+ (NSMutableArray *)sortArrayByKey:(NSString *)key
                             array:(NSMutableArray *)array
                         ascending:(BOOL)ascending;


@end
