//
//  NSFileManager+category.h
//  OrganizationDepartment
//
//  Created by gaojuan on 16/10/12.
//  Copyright © 2016年 bodaokeji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (category)

/**
 * 返回一个保存到 Documents 的路径
 * path 保存的文件的名字
 */
+ (NSString *)savePathFromDocumentsDirectoryWithPath:(NSString *)path;


/**
 *  Get the Documents directory for a filename
 *
 *  @param fileName Filename
 *
 *  @return Return the directory as a NSString
 */
+ (NSString *)getDocumentsDirectoryForFile:(NSString *)fileName;

@end
