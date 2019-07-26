//
//  NSArray+category.h
//  OrganizationDepartment
//
//  Created by xiaoshunliang on 16/9/16.
//  Copyright © 2016年 bodaokeji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (category)
/**
 *  Create a reversed array from the given array
 *
 *  @param array The array to be converted
 *
 *  @return Return the reversed array
 */
+ (NSString *)arrayToJson:(NSArray *)array;
/**
 *  Get the object at a given index in safe mode (nil if self is empty or out of range)
 *
 *  @param index The index
 *
 *  @return Return the object at a given index in safe mode (nil if self is empty or out of range)
 */
- (id)safeObjectAtIndex:(NSUInteger)index;
/**
 *  Create a reversed array from the given array
 *  @return Return the reversed array
 */

/**
 数组升序排列
 */
+ (NSArray *)sortArrByAscending:(NSArray *)arr;
@end
