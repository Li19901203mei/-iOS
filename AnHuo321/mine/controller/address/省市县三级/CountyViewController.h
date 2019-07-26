//
//  CountyViewController.h
//  Vpay
//
//  Created by mac on 2018/10/16.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
//@protocol AddViewControllerDelegate <NSObject>
//
//-(void)addView:(NSString *)name countyId:(NSString*)id;
//
//@end
@interface CountyViewController : UIViewController
@property(nonatomic,copy)NSString*countyName;
@property(nonatomic,copy)NSString * countyID;

@property(nonatomic,copy)NSString * proID;
//@property(nonatomic,weak)id<AddViewControllerDelegate> delegare;
@end

NS_ASSUME_NONNULL_END
