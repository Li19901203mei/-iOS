//
//  NSMutableArray+category.m
//  MiYun360
//
//  Created by xiaoshunliang on 16/5/20.
//  Copyright © 2016年 AUNotBad. All rights reserved.
//

#import "NSMutableArray+category.h"

@implementation NSMutableArray (category)
- (id)safeObjectAtIndex:(NSUInteger)index {
    if ([self count] > 0 && [self count] > index)
        return [self objectAtIndex:index];
    else
        return nil;
}
+ (NSMutableArray *)sortArrayByKey:(NSString *)key array:(NSMutableArray *)array ascending:(BOOL)ascending {
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    [tempArray removeAllObjects];
    [tempArray addObjectsFromArray:array];
    
    NSSortDescriptor *brandDescriptor = [[NSSortDescriptor alloc] initWithKey:key ascending:ascending];
    NSArray *sortDescriptors = [NSArray arrayWithObjects:brandDescriptor, nil];
    NSArray *sortedArray = [tempArray sortedArrayUsingDescriptors:sortDescriptors];
    [tempArray removeAllObjects];
    tempArray = (NSMutableArray *)sortedArray;
    [array removeAllObjects];
    [array addObjectsFromArray:tempArray];
    
    return array;
}


@end
