//
//  UIWebView+category.h
//  IntelligenceStudents
//
//  Created by xiaoshunliang on 2016/12/16.
//  Copyright © 2016年 GaoJuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWebView (category)
/**
 *  Remove the background shadow of the UIWebView
 */
- (void)removeBackgroundShadow;

/**
 *  Load the requested website
 *
 *  @param website Website to load
 */
- (void)loadWebsite:(NSString *)website;
@end
