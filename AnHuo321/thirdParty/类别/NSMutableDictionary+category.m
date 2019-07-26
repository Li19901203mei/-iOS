//
//  NSMutableDictionary+category.m
//  IntelligenceStudents
//
//  Created by xiaoshunliang on 2016/12/19.
//  Copyright © 2016年 GaoJuan. All rights reserved.
//

#import "NSMutableDictionary+category.h"

@implementation NSMutableDictionary (category)
- (BOOL)safeSetObject:(id)anObject forKey:(id<NSCopying>)aKey
{
    if(nil == anObject)
    {
        return NO;
    }
    
    [self setObject:anObject forKey:aKey];
    return YES;
}

@end
