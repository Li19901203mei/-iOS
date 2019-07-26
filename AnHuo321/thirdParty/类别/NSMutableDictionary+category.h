//
//  NSMutableDictionary+category.h
//  IntelligenceStudents
//
//  Created by xiaoshunliang on 2016/12/19.
//  Copyright © 2016年 GaoJuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (category)
/**
 *  Set the object for a given key in safe mode (if not nil)
 *
 *  @param anObject The object
 *  @param aKey     The key
 *
 *  @return Return YES if has been setted, otherwise NO
 */
- (BOOL)safeSetObject:(id)anObject
               forKey:(id <NSCopying> )aKey;
@end
