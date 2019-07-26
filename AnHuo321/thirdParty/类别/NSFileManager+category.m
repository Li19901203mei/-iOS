//
//  NSFileManager+category.m
//  OrganizationDepartment
//
//  Created by gaojuan on 16/10/12.
//  Copyright © 2016年 bodaokeji. All rights reserved.
//

#import "NSFileManager+category.h"

@implementation NSFileManager (category)

// 返回一个保存到 Documents 的路径
+ (NSString *)savePathFromDocumentsDirectoryWithPath:(NSString *)path {

    NSString *pathString = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    return [pathString stringByAppendingPathComponent:path];
    
}

/**
 *  Get the Documents directory for a filename
 *
 *  @param fileName Filename
 *
 *  @return Return the directory as a NSString
 */
+ (NSString *)getDocumentsDirectoryForFile:(NSString *)fileName {

    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    return [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/", fileName]];
}
@end
