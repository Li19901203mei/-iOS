//
//  NSDictionary+category.h
//  OrganizationDepartment
//
//  Created by xiaoshunliang on 16/9/16.
//  Copyright © 2016年 bodaokeji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (category)
/**
 *  Convert self to JSON as NSString
 *
 *  @return Return the JSON as NSString or nil if error while parsing
 */
- (NSString *)dictionaryToJson;
- (id)safeObjectForKey:(NSString *)key;
@end
